let corazon = corazon;
let callbacks = {};

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Fonctions Generales FiveM

function RegisterNetEvent(eventName, target) {
    RegisterNetEvent(eventName, target);
}

function AddEventHandler(eventName, callback) {
    on(eventName, callback);
}

function TriggerEvent(eventName, args) {
    emit(eventName, args);
}

function TriggerEventClient(eventName, args) {
    emitNet(eventName, args);
}

function TriggerEventServer(eventName, args) {
    emitNet(eventName, args);
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Server callback

function serverCallback( name, data, cb ) {
    let id = Object.keys( callbacks ).length++;
    callbacks[id] = cb;
    data['CallbackID'] = id;
    emitNet(name, data);
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////