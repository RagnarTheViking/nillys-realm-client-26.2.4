package _0y
{
   import _4u.Account;
   import com.company.assembleegameclient.util.GUID;
   import flash.net.SharedObject;
   import com.company.assembleegameclient.parameters.Parameters;
   import flash.external.ExternalInterface;
   
   public class _0T_W_ implements Account
   {
      
      public static const _1R_H_:String = "rotmg";
      
      private static const _0C_k:String = "";
      
      private static const _0hl:String = "rotmg";
       
      
      private var userId:String = "";
      
      private var password:String;
      
      private var _D_p:String = "";
      
      private var _jU_:Boolean;
      
      private var _10f:String;
      
      public var signedRequest:String;
      
      public var _066:String;
      
      public function _0T_W_()
      {
         super();
         try
         {
            this._D_p = ExternalInterface.call("rotmg.UrlLib.getParam","entrypt");
            return;
         }
         catch(error:Error)
         {
            return;
         }
      }
      
      public function _1yb() : String
      {
         return this.userId;
      }
      
      public function getUserId() : String
      {
         return this.userId = this.userId || GUID.create();
      }
      
      public function _0a7() : String
      {
         return this.password || "";
      }
      
      public function credentials() : Object
      {
         return {
            "guid":this.getUserId(),
            "password":this._0a7()
         };
      }
      
      public function registered() : Boolean
      {
         return this._0a7() != "";
      }
      
      public function _0cX_(param1:String, param2:String) : void
      {
         var _loc3_:SharedObject = null;
         this.userId = param1;
         this.password = param2;
         try
         {
            _loc3_ = SharedObject.getLocal("nRotMG","/");
            _loc3_.data["GUID"] = param1;
            _loc3_.data["Password"] = param2;
            _loc3_.flush();
            return;
         }
         catch(error:Error)
         {
            return;
         }
      }
      
      public function clear() : void
      {
         this._0cX_(GUID.create(),null);
         Parameters._1C_j = true;
         Parameters.data_.charIdUseMap = {};
         Parameters.save();
      }
      
      public function _rO_(param1:String, param2:int) : void
      {
      }
      
      public function _2R_() : String
      {
         return "/credits";
      }
      
      public function _00Z_() : String
      {
         return _0C_k;
      }
      
      public function _L_y() : String
      {
         return _1R_H_;
      }
      
      public function _0fT_() : String
      {
         return _0hl;
      }
      
      public function _1jd() : String
      {
         return this._D_p || "";
      }
      
      public function _1xj() : String
      {
         return "";
      }
      
      public function verify(param1:Boolean) : void
      {
         this._jU_ = param1;
      }
      
      public function _0aB_() : Boolean
      {
         return this._jU_;
      }
      
      public function _0bQ_() : String
      {
         return this._10f || "";
      }
      
      public function _1Z_w(param1:String) : void
      {
         this._10f = param1;
      }
      
      public function _091() : String
      {
         return this.signedRequest;
      }
      
      public function _1e0() : String
      {
         return this._066;
      }
   }
}
