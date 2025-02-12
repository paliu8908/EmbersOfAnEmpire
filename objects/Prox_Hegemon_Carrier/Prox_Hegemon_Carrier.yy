{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "Prox_Hegemon_Carrier",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":8,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,},
  ],
  "managed": true,
  "overriddenProperties": [
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"Com_Unit_Ship_Turret","path":"objects/Com_Unit_Ship_Turret/Com_Unit_Ship_Turret.yy",},"propertyId":{"name":"type","path":"objects/Com_Unit_Ship_Turret/Com_Unit_Ship_Turret.yy",},"value":"\"heavy ship\"",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"priority","path":"objects/com_unit/com_unit.yy",},"value":"70",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"name","path":"objects/com_unit/com_unit.yy",},"value":"\"Hegemon Command Ship\"",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"portrait","path":"objects/com_unit/com_unit.yy",},"value":"Portrait_Hegemon",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"stunResist","path":"objects/com_unit/com_unit.yy",},"value":"10",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"killXP","path":"objects/com_unit/com_unit.yy",},"value":"500",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"blurb","path":"objects/com_unit/com_unit.yy",},"value":"\"Command Ship. Possesses modules to build and resupply troops.\"",},
  ],
  "parent": {
    "name": "Proximae",
    "path": "folders/Objects/Units/Ships/Proximae.yy",
  },
  "parentObjectId": {
    "name": "Com_Unit_Ship_Turret",
    "path": "objects/Com_Unit_Ship_Turret/Com_Unit_Ship_Turret.yy",
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
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"hp","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"1500","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"acceleration","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0.1","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"move_speed","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0.9","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"turnRadius","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0.1","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"faction_number","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"1","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"burst","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"reload_time","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"burst_delay","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"range","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"block","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"10","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"weapon","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"noone","varType":5,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"fireAngle","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"stopDis","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"50","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"unitSpread","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"700","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":" shootAngle","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"dmgReduction","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0.7","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"turretAngle","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"turretRotation","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"1","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"turretTurnAngle","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"360","varType":0,},
  ],
  "solid": false,
  "spriteId": {
    "name": "Hegemon",
    "path": "sprites/Hegemon/Hegemon.yy",
  },
  "spriteMaskId": null,
  "visible": true,
}