// Auto-generated. Do not edit!

// (in-package practice.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class my_property {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
      this.Class = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('Class')) {
        this.Class = initObj.Class
      }
      else {
        this.Class = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type my_property
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [Class]
    bufferOffset = _serializer.uint16(obj.Class, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type my_property
    let len;
    let data = new my_property(null);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [Class]
    data.Class = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.name);
    return length + 6;
  }

  static datatype() {
    // Returns string type for a message object
    return 'practice/my_property';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7b612338cd379b8b3ac06022ef0b6cbc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #根据python文件中的内容补全该文件
    
    string name
    uint16 Class
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new my_property(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.Class !== undefined) {
      resolved.Class = msg.Class;
    }
    else {
      resolved.Class = 0
    }

    return resolved;
    }
};

module.exports = my_property;
