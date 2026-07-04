# APIProject

# Aufgabe: Sichere B2B-Partner-API für Bestellstatus

## Beschreibung:
´´´
 Ein externer Partner soll über Azure API Management (APIM) den Bestellstatus abrufen. Ein Kommunikationsaustausch ist nur über das APIM erlaubt und muss abgesichert (bevorzugt Mutual TLS, alternativ JWT oder API-Key) sein. Die hierfür erforderlichen Konfigurationen, Source-Code etc. werden idealerweise automatisiert bereitgestellt (Terraform + CI/CD).
 ´´´

 ### Infrastruktur:
 - API-Management Dienst
 - Eine Netzwerksicherheitskomponente (z.B. Subnetze, Firewall, Gateway, oder Sicherheitsgruppen), die den Zugriff auf das API-Management und Backend absichert

### API:
Implementiere eine einfache REST-API gegen das Backend mit mindestens diesen Endpunkten:

 - GET /orders/{orderId}: Gibt Status-Informationen zu einer Bestellung zurück.
 - POST /orders – Erstellt eine neue Bestellung (mit Bestellung-Daten im Request-Body)
 - PUT /orders/{orderId} – Aktualisiert eine bestehende Bestellung (Teil- oder Vollupdate)
 - GET /health: Health-Check der API

### APIM Konfiguration:
´´´
Integriere die Backend-API in die API-Management-Umgebung.
Schütze die API mit einer starken Authentifizierung (z. B. Client-Zertifikat (Mutual TLS), API-Key oder JWT).
Definiere Zugriffsregeln wie Rate Limiting, um Missbrauch zu verhindern.
´´´

### Automatisierung und Bereitstellung:
´´´
Stelle sicher, dass die komplette Infrastruktur und Konfiguration automatisiert und reproduzierbar aufgebaut werden kann (Infrastructure as Code).
Automatisiere auch die Bereitstellung der Backend-API und der API-Management-Konfiguration über eine CI/CD-Pipeline.
´´´

### Überwachung und Logging:
´´´
Aktiviere Monitoring und Logging auf API-Management und Backend-Seite, um Zugriffe und Fehler nachvollziehen zu können.
´´´

## Commands:
    - source .venv/bin/activate
