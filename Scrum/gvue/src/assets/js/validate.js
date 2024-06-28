	// 只能为数字验证
	export function isNumber(rule, value, callback) {
        var number = /^\d+$|^\d+[.]?\d+$/
        if (!number.test(value)) {
          callback(new Error("格式有误,只能为数字"));
        } else {
          callback();
        }
      };
      // 只能为中文校验
      export function isChinese(rule, value, callback) {
        var reg = /^[\u4e00-\u9fa5]+$/
        if (!reg.test(value)) {
          callback(new Error("格式有误,只能为中文"));
        } else {
          callback();
        }
      };
      // 特殊符号验证
      export function checkSpecificKey(str) {
        var specialKey = "[`%~!$^&*()=|{}':;',\\[\\].<>/?~！￥……&*（）——|{}【】‘；：”“'。，、？]‘'";
        for (var i = 0; i < str.length; i++) {
          if (specialKey.indexOf(str.substr(i, 1)) != -1) {
            return false;
          }
        }
        return true;
      };
      // 特殊符号验证
      export function isSymbol(rule, value, callback) {
        if (!checkSpecificKey(value)) {
          callback(new Error("格式有误,不支持特殊符号"));
        } else {
          callback();
        }
      };
  
  