{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "Prox_Mech_Arbalester",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,},
  ],
  "managed": true,
  "overriddenProperties": [
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"atk_off_x","path":"objects/com_unit/com_unit.yy",},"value":"0",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"atk_off_y","path":"objects/com_unit/com_unit.yy",},"value":"0",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"name","path":"objects/com_unit/com_unit.yy",},"value":"\"Arbalester Mech\"",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"priority","path":"objects/com_unit/com_unit.yy",},"value":"15",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"portrait","path":"objects/com_unit/com_unit.yy",},"value":"Portrait_Arbalester",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"killXP","path":"objects/com_unit/com_unit.yy",},"value":"15",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"blurb","path":"objects/com_unit/com_unit.yy",},"value":"\"Basic Mech. Armed with a light laser rifle and dual mgs.\"",},
  ],
  "parent": {
    "name": "Proximae",
    "path": "folders/Objects/Units/Fighters/Proximae.yy",
  },
  "parentObjectId": {
    "name": "Com_Unit_Mech",
    "path": "objects/Com_Unit_Mech/Com_Unit_Mech.yy",
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
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"hp","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"60","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"acceleration","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"5","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"move_speed","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"3","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"turnRate","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"15","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"faction_number","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"1","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"burst","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"1","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"reload_time","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"4","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"burst_delay","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"range","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"625","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"block","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"weapon","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"Prox_Arbalester_Laser","varType":5,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"fireAngle","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"10","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"stopDis","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"50","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"unitSpread","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"128","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"shootAngle","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"dmgReduction","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"1","varType":0,},
  ],
  "solid": false,
  "spriteId": {
    "name": "Arbalester",
    "path": "sprites/Arbalester/Arbalester.yy",
  },
  "spriteMaskId": null,
  "visible": true,
}