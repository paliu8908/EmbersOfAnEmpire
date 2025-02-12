{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "Ark_Fighter_Bay",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,},
  ],
  "managed": true,
  "overriddenProperties": [
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"name","path":"objects/com_unit/com_unit.yy",},"value":"\"Fighter Bay\"",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"portrait","path":"objects/com_unit/com_unit.yy",},"value":"Union_Portrait",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"priority","path":"objects/com_unit/com_unit.yy",},"value":"-15",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"Com_Unit_Structure","path":"objects/Com_Unit_Structure/Com_Unit_Structure.yy",},"propertyId":{"name":"energyExpended","path":"objects/Com_Unit_Structure/Com_Unit_Structure.yy",},"value":"15",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"Com_Unit_Structure","path":"objects/Com_Unit_Structure/Com_Unit_Structure.yy",},"propertyId":{"name":"productionSpeed","path":"objects/Com_Unit_Structure/Com_Unit_Structure.yy",},"value":"1",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"Com_Unit_Structure","path":"objects/Com_Unit_Structure/Com_Unit_Structure.yy",},"propertyId":{"name":"slowProduceSpeed","path":"objects/Com_Unit_Structure/Com_Unit_Structure.yy",},"value":"0.5",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"Com_Unit_Structure","path":"objects/Com_Unit_Structure/Com_Unit_Structure.yy",},"propertyId":{"name":"canProduce","path":"objects/Com_Unit_Structure/Com_Unit_Structure.yy",},"value":"True",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"killXP","path":"objects/com_unit/com_unit.yy",},"value":"20",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_unit","path":"objects/com_unit/com_unit.yy",},"propertyId":{"name":"blurb","path":"objects/com_unit/com_unit.yy",},"value":"\"Builds fighters.\"",},
  ],
  "parent": {
    "name": "Arkeyevich",
    "path": "folders/Objects/Units/Structures/Arkeyevich.yy",
  },
  "parentObjectId": {
    "name": "Com_Unit_Structure",
    "path": "objects/Com_Unit_Structure/Com_Unit_Structure.yy",
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
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"hp","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"500","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"faction_number","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"dmgReduction","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"1","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"hasShield","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"false","varType":3,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"block","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"1","varType":0,},
  ],
  "solid": false,
  "spriteId": {
    "name": "FighterDock",
    "path": "sprites/FighterDock/FighterDock.yy",
  },
  "spriteMaskId": null,
  "visible": true,
}