# Clean-Swift-Arquitecture
This repository is only a proof of concept, based on clean swift and viper. Suggestion are welcome ;) don't hesitate.

Concepts are simple and use 5 elements on each module:

- Interactor: Busniess Logic, has use cases(protocols (ISP)) and services on each one. You should inject services on implementators.
- Presenter: Only has data for present to view and view state.
- View: Get inputs to the interactor or router and show data.
- Entity: DTO, it carry data but are too simple like a POJO.
- Router: It knows how to navigate.

Every object should have only one responsabilty (SRP) and components and element implementations are isolated by interfaces (DIP).

Please if you can help me to improve i will so glad. Test are comming soon. 
