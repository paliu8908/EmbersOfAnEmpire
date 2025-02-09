{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "Ark_Kepler_Support",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":8,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":56,"eventType":6,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":65,"eventType":9,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":83,"eventType":9,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":68,"eventType":9,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":70,"eventType":9,"isDnD":false,},
  ],
  "managed": true,
  "overriddenProperties": [
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"name","path":"objects/com_unit/com_unit.yy",},"value":"\"Kepler Missile Ship\"",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"portrait","path":"objects/com_unit/com_unit.yy",},"value":"Kepler_Portrait",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"priority","path":"objects/com_unit/com_unit.yy",},"value":"150",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"Com_Unit_Ship_Turret","path":"objects/Com_Unit_Ship_Turret/Com_Unit_Ship_Turret.yy",},"propertyId":{"name":"type","path":"objects/Com_Unit_Ship_Turret/Com_Unit_Ship_Turret.yy",},"value":"\"light ship\"",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"killXP","path":"objects/com_unit/com_unit.yy",},"value":"150",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"blurb","path":"objects/com_unit/com_unit.yy",},"value":"\"Payload Platform. Can launch a variety of missiles or scan enemies to reduce their armour.\"",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"abilityChargeRate","path":"objects/com_unit/com_unit.yy",},"value":"0",},
  ],
  "parent": {
    "name": "Tier_3",
    "path": "folders/Objects/Units/Ships/Arkeyevich/Tier_3.yy",
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
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"hp","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"290","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"acceleration","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"1","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"move_speed","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"2.05","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"turnRadius","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"1","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"faction_number","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"burst","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"1","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"reload_time","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"6","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"burst_delay","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"range","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"1500","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"block","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"1","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"weapon","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"Ark_Kepler_Scan_Field","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"fireAngle","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"180","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"stopDis","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"50","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"unitSpread","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"175","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":" shootAngle","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"dmgReduction","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"1","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"turretAngle","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"turretRotation","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"10","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"turretTurnAngle","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"360","varType":0,},
  ],
  "solid": false,
  "spriteId": {
    "name": "spr_kepler_crusier",
    "path": "sprites/spr_kepler_crusier/spr_kepler_crusier.yy",
  },
  "spriteMaskId": null,
  "visible": true,
}