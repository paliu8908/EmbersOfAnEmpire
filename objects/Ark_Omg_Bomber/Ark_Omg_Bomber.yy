{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "Ark_Omg_Bomber",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,},
  ],
  "managed": true,
  "overriddenProperties": [
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"priority","path":"objects/com_unit/com_unit.yy",},"value":"30",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"name","path":"objects/com_unit/com_unit.yy",},"value":"\"Omega Gunship\"",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"portrait","path":"objects/com_unit/com_unit.yy",},"value":"Omega_Portrait",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"killXP","path":"objects/com_unit/com_unit.yy",},"value":"20",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"blurb","path":"objects/com_unit/com_unit.yy",},"value":"\"Missile Gunship. Strong against Fighters.\"",},
  ],
  "parent": {
    "name": "Arkeyevich",
    "path": "folders/Objects/Units/Fighters/Arkeyevich.yy",
  },
  "parentObjectId": {
    "name": "Com_Unit_Fighter",
    "path": "objects/Com_Unit_Fighter/Com_Unit_Fighter.yy",
  },
  "persistent": false,
  "physicsAngularDamping": 0.1,
  "physicsDensity": 0.5,
  "physicsFriction": 0.2,
  "physicsGroup": 1,
  "physicsKinematic": false,
  "physicsLinearDamping": 0.1,
  "physicsObject": false,
  "physicsRestitution": 0.1,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsShapePoints": [],
  "physicsStartAwake": true,
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"hp","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"30","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"acceleration","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"2","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"move_speed","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"1.5","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"turnRate","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"14","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"faction_number","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"burst","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"8","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"reload_time","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"8","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"burst_delay","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0.5","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"range","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"600","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"block","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"weapon","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"Ark_Bomber_Missile","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"fireAngle","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"360","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"stopDis","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"120","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"unitSpread","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"100","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"shootAngle","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"dmgReduction","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"1","varType":0,},
  ],
  "solid": false,
  "spriteId": {
    "name": "Omega_Bomber",
    "path": "sprites/Omega_Bomber/Omega_Bomber.yy",
  },
  "spriteMaskId": null,
  "visible": true,
}