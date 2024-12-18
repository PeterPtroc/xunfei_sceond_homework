// Auto-generated. Do not edit!

// (in-package something_about_topic.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class mag {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.magnetic_field = null;
      this.magnetic_field_covariance = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('magnetic_field')) {
        this.magnetic_field = initObj.magnetic_field
      }
      else {
        this.magnetic_field = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('magnetic_field_covariance')) {
        this.magnetic_field_covariance = initObj.magnetic_field_covariance
      }
      else {
        this.magnetic_field_covariance = new Array(9).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type mag
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [magnetic_field]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.magnetic_field, buffer, bufferOffset);
    // Check that the constant length array field [magnetic_field_covariance] has the right length
    if (obj.magnetic_field_covariance.length !== 9) {
      throw new Error('Unable to serialize array field magnetic_field_covariance - length must be 9')
    }
    // Serialize message field [magnetic_field_covariance]
    bufferOffset = _arraySerializer.float64(obj.magnetic_field_covariance, buffer, bufferOffset, 9);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type mag
    let len;
    let data = new mag(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [magnetic_field]
    data.magnetic_field = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [magnetic_field_covariance]
    data.magnetic_field_covariance = _arrayDeserializer.float64(buffer, bufferOffset, 9)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 96;
  }

  static datatype() {
    // Returns string type for a message object
    return 'something_about_topic/mag';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2f3b0b43eed0c9501de0fa3ff89a45aa';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    geometry_msgs/Vector3 magnetic_field
    float64[9] magnetic_field_covariance
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new mag(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.magnetic_field !== undefined) {
      resolved.magnetic_field = geometry_msgs.msg.Vector3.Resolve(msg.magnetic_field)
    }
    else {
      resolved.magnetic_field = new geometry_msgs.msg.Vector3()
    }

    if (msg.magnetic_field_covariance !== undefined) {
      resolved.magnetic_field_covariance = msg.magnetic_field_covariance;
    }
    else {
      resolved.magnetic_field_covariance = new Array(9).fill(0)
    }

    return resolved;
    }
};

module.exports = mag;
