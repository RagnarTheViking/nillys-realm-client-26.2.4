package _1N_W_
{
   import _4u.Account;
   import _ki._yx;
   import flash.external.ExternalInterface;
   
   public class _0D_Q_ implements Account
   {
      
      public static const _1R_H_:String = "kabam.com";
      
      private static const _as:String = "kabam.com";
       
      
      private var _D_p:String;
      
      private var userId:String = "";
      
      private var password:String = null;
      
      private var _jU_:Boolean;
      
      private var _10f:String;
      
      public var signedRequest:String;
      
      public var userSession:Object;
      
      [Inject]
      public var _0qa:_yx;
      
      public function _0D_Q_()
      {
         var _loc1_:String = null;
         super();
         try
         {
            _loc1_ = ExternalInterface.call("rotmg.UrlLib.getParam","entrypt");
            if(_loc1_ != null)
            {
               this._D_p = _loc1_;
            }
            return;
         }
         catch(error:Error)
         {
            return;
         }
      }
      
      public function _0cX_(param1:String, param2:String) : void
      {
         this.userId = param1;
         this.password = param2;
      }
      
      public function _2R_() : String
      {
         return "/credits";
      }
      
      public function credentials() : Object
      {
         return {
            "guid":this.getUserId(),
            "secret":this._1xj(),
            "signedRequest":this.signedRequest
         };
      }
      
      public function _1jd() : String
      {
         return this._D_p || "";
      }
      
      public function _00Z_() : String
      {
         if(this.userSession == null || this.userSession["kabam_naid"] == null)
         {
            return "";
         }
         return this.userSession["kabam_naid"];
      }
      
      public function _L_y() : String
      {
         return _1R_H_;
      }
      
      public function _1yb() : String
      {
         if(this.userSession == null || this.userSession["user"] == null || this.userSession["user"]["email"] == null)
         {
            return "";
         }
         var _loc1_:String = this.userSession["user"]["email"];
         var _loc2_:Array = _loc1_.split("@",2);
         if(_loc2_.length != 2)
         {
            return "";
         }
         return _loc2_[0];
      }
      
      public function getUserId() : String
      {
         return this.userId;
      }
      
      public function _vX_() : Boolean
      {
         return false;
      }
      
      public function registered() : Boolean
      {
         return true;
      }
      
      public function _0fT_() : String
      {
         return _as;
      }
      
      public function _1xj() : String
      {
         return this.password || "";
      }
      
      public function _0a7() : String
      {
         return "";
      }
      
      public function clear() : void
      {
      }
      
      public function _rO_(param1:String, param2:int) : void
      {
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
         return this.userSession["oauth_token"];
      }
      
      public function _1e0() : String
      {
         return this._00Z_();
      }
   }
}
