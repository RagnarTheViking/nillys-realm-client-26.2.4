package _y0
{
   import _4u.Account;
   import _0u4._0us;
   
   public class Kong implements Account
   {
      
      public static const _1R_H_:String = "kongregate";
       
      
      [Inject]
      public var _1iN_:_0us;
      
      private var userId:String = "";
      
      private var password:String;
      
      private var _jU_:Boolean;
      
      private var _10f:String;
      
      public function Kong()
      {
         super();
      }
      
      public function _0cX_(param1:String, param2:String) : void
      {
         this.userId = param1;
         this.password = param2;
      }
      
      public function _1yb() : String
      {
         return this._1iN_._1yb();
      }
      
      public function getUserId() : String
      {
         return this.userId;
      }
      
      public function _0a7() : String
      {
         return "";
      }
      
      public function _1xj() : String
      {
         return this.password || "";
      }
      
      public function credentials() : Object
      {
         return {
            "guid":this.getUserId(),
            "secret":this._1xj()
         };
      }
      
      public function registered() : Boolean
      {
         return this._1xj() != "";
      }
      
      public function _00Z_() : String
      {
         return this._1iN_.getUserId();
      }
      
      public function _L_y() : String
      {
         return _1R_H_;
      }
      
      public function _0fT_() : String
      {
         return "kongregate";
      }
      
      public function _rO_(param1:String, param2:int) : void
      {
         this._1iN_._1P_s(param1,param2);
      }
      
      public function _2R_() : String
      {
         return "/kongregate";
      }
      
      public function _1jd() : String
      {
         return "kongregate";
      }
      
      public function clear() : void
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
         throw new Error("No current support for new Kabam offer wall on Kongregate.");
      }
      
      public function _1e0() : String
      {
         throw new Error("No current support for new Kabam offer wall on Kongregate.");
      }
   }
}
