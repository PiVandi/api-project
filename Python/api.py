#INFO: https://www.youtube.com/watch?v=z3YMz-Gocmw

from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_restful import Resource, Api, reqparse, fields, marshal_with, abort

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///database.db"
db = SQLAlchemy(app)
api = Api(app)


class OrderModel(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    content = db.Column(db.JSON, nullable=False) #Sollte Array sein, -> Später anpassen
    status = db.Column(db.String(80), nullable=False)
    
    def __repr__(self):
        return f"Order(content = {self.content}, status = {self.status})"

user_args = reqparse.RequestParser()
user_args.add_argument("content", type=list,location="json" ,required=True, help="Content cannot be blank!")
user_args.add_argument("status", type=str, location="json", required=True, help="Email cannot be blank!") # Status sollte nicht vom User änderbar sein!

orderFields = {
    "id":fields.Integer,
    "content":fields.Raw,
    "status":fields.String,
}


class Orders(Resource):
    @marshal_with(orderFields)
    def get(self):
        orders = OrderModel.query.all()
        return orders

    @marshal_with(orderFields)
    def post(self):
        args = user_args.parse_args()
        order = OrderModel(content=args["content"], status=args["status"])
        db.session.add(order)
        db.session.commit()
        orders = OrderModel.query.all()
        return orders, 201



class Order(Resource):
    @marshal_with(orderFields)
    def get(self, id):
        order = OrderModel.query.filter_by(id=id).first()
        if not order:
            abort(404, "Order not found")

        return order

    @marshal_with(orderFields)
    def patch(self, id): # Wieso Patch nicht Put?
        args = user_args.parse_args()
        order = OrderModel.query.filter_by(id=id).first()
        if not order:
            abort(404, "Order not found")
        order.content = args["content"]
        order.status = args["status"]
        db.session.commit()

        return order

    @marshal_with(orderFields)
    def delete(self, id):
        order = OrderModel.query.filter_by(id=id).first()
        if not order:
            abort(404, "Order not found")
        db.session.delete(order)
        db.session.commit()
        orders = OrderModel.query.all()

        return orders



@app.route("/")
def home():
    return "<h1>Hey, This is an API Project!</h1>"

@app.route("/api/health")
def health():
    return {"status": "OK"}, 200


api.add_resource(Orders, "/api/orders/")
api.add_resource(Order, "/api/orders/<int:id>")


if __name__ == "__main__":
    app.run(debug=True)
