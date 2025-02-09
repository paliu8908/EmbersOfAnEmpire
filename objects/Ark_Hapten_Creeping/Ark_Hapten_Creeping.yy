{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "Ark_Hapten_Creeping",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":1,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":8,"isDnD":false,},
  ],
  "managed": true,
  "overriddenProperties": [
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_projectile","path":"objects/com_projectile/com_projectile.yy",},"propertyId":{"name":"spread_x","path":"objects/com_projectile/com_projectile.yy",},"value":"0",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_projectile","path":"objects/com_projectile/com_projectile.yy",},"propertyId":{"name":"spread_y","path":"objects/com_projectile/com_projectile.yy",},"value":"0",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_projectile","path":"objects/com_projectile/com_projectile.yy",},"propertyId":{"name":"dataIndex","path":"objects/com_projectile/com_projectile.yy",},"value":"16",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"com_projectile","path":"objects/com_projectile/com_projectile.yy",},"propertyId":{"name":"dataProvided","path":"objects/com_projectile/com_projectile.yy",},"value":"0.25",},
  ],
  "parent": {
    "name": "Burst",
    "path": "folders/Objects/Projectiles/Burst.yy",
  },
  "parentObjectId": {
    "name": "com_projectile",
    "path": "objects/com_projectile/com_projectile.yy",
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
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"damage","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"25","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"range","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"2500","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"faction_number","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"move_speed","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"25","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"type","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"\"burst\"","varType":2,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"bonusType","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"\"none\"","varType":2,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"bonusDamage","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"0","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"bonusMultiplier","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"1","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"splash_radius","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"50","varType":0,},
  ],
  "solid": false,
  "spriteId": {
    "name": "spr_hapten_guass",
    "path": "sprites/spr_hapten_guass/spr_hapten_guass.yy",
  },
  "spriteMaskId": null,
  "visible": true,
}