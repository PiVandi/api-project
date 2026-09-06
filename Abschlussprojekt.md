# Projekt-Kurzbeschreibung:

Im Rahmen des Projektes wird ein Proof of Concept zur Evaluierung von Azure API Management als zentralem API-Gateway für das Unternehmen konzipiert und umgesetzt. Dazu wird eine selbst entwickelte REST-API containerisiert und über Azure API Management bereitgestellt. Die benötigte Azure-Infrastruktur wird vollständig mittels Terraform als Infrastructure as Code erstellt. Zusätzlich wird ein einfacher CI/CD-Prozess zur automatisierten Bereitstellung der Anwendung umgesetzt. Abschließend wird die Lösung hinsichtlich Funktionalität, Sicherheit, Automatisierbarkeit und möglicher zukünftiger Einsatzszenarien im Unternehmen bewertet.

# Projektbeschreibung:

## Ausgangssituation:

Das Unternehmen verfügt derzeit über keine produktive Cloud-Infrastruktur und hat bislang nur geringe bzw. keine praktische Erfahrung mit der Bereitstellung von Anwendungen in Containern, Infrastructure as Code (IaC) oder automatisierten Deployment-Prozessen.
Im Zuge der zukünftigen Weiterentwicklung der IT-Infrastruktur soll geprüft werden, ob moderne Cloud-Technologien für die Bereitstellung und Verwaltung von APIs einen geeigneten Mehrwert für das Unternehmen bieten. Insbesondere soll untersucht werden, ob ein zentraler API-Gateway-Ansatz die einheitliche Bereitstellung, Absicherung und Verwaltung von APIs ermöglichen kann.
Da die hierfür erforderlichen Technologien und Prozesse im Unternehmen bisher nicht etabliert sind, soll zunächst ein technisch begrenzter Proof of Concept (PoC) durchgeführt werden. Die dabei gewonnenen Erkenntnisse sollen als Entscheidungsgrundlage für einen möglichen zukünftigen Einsatz dienen.

## Projektziel:

Ziel des Projektes ist die Konzeption und prototypische Umsetzung einer cloudbasierten API-Management-Lösung auf Basis von Microsoft Azure.
Hierzu wird eine kleine, selbst entwickelte REST-API als Container bereitgestellt und über Azure API Management als zentralem API-Gateway veröffentlicht. Die erforderlichen Azure-Ressourcen sollen mittels Terraform als Infrastructure as Code automatisiert erstellt und konfiguriert werden.
Ergänzend soll ein einfacher automatisierter Deployment-Prozess umgesetzt werden, um den Weg von der Änderung des Quellcodes über den Build und die Bereitstellung des Containers bis zur Aktualisierung der API nachvollziehbar und reproduzierbar abzubilden.

## Geplanter Projektumfang:

Der technische Schwerpunkt liegt auf einem vollständigen, aber bewusst schlanken End-to-End-Szenario:

Quellcode → CI/CD-Pipeline → Container → Azure → API Management → API-Aufruf

Hierfür werden die benötigten Azure-Ressourcen mit Terraform bereitgestellt. Die Beispiel-API wird containerisiert und in einer geeigneten Azure-Containerumgebung betrieben. Azure API Management übernimmt die zentrale Veröffentlichung und Verwaltung der API.

## Projektabgrenzung:

Aufgrund des begrenzten Projektzeitraums wird der Proof of Concept bewusst auf die technische Machbarkeit und grundlegende Evaluierung der vorgesehenen Architektur beschränkt.
Die entwickelte API dient ausschließlich als überschaubare Referenzanwendung zur Demonstration und Bewertung der gewählten Architektur. Der Schwerpunkt liegt auf der Integration und Automatisierung der beteiligten Komponenten und nicht auf der Entwicklung einer umfangreichen Anwendung.
Das Ergebnis des Projektes soll somit keine produktive Einführung darstellen, sondern eine belastbare technische Entscheidungsgrundlage für einen möglichen zukünftigen Einsatz von Cloud-, Container-, CI/CD- und API-Management-Technologien im Unternehmen liefern.
