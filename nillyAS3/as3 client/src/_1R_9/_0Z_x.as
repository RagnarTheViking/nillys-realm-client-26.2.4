package _1R_9
{
   import _4u.Account;
   import com.company.util._0vj;
   
   public class _0Z_x implements Account
   {
      
      public static const _1R_H_:String = "steam";
       
      
      [Inject]
      public var _1iN_:_1R_9._J_m;
      
      private var userId:String = "";
      
      private var password:String = null;
      
      private var _jU_:Boolean;
      
      private var _10f:String;
      
      public function _0Z_x()
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
         return this._1iN_.getPersonaName();
      }
      
      public function getUserId() : String
      {
         return this.userId = this.userId || "";
      }
      
      public function _0a7() : String
      {
         return "";
      }
      
      public function _1xj() : String
      {
         return this.password = this.password || "";
      }
      
      public function credentials() : Object
      {
         var _loc1_:Object = {};
         _loc1_.guid = this.getUserId();
         _loc1_.secret = this._1xj();
         _loc1_.steamid = this._1iN_._0mw();
         return _loc1_;
      }
      
      public function registered() : Boolean
      {
         return this._1xj() != "";
      }
      
      public function _vX_() : Boolean
      {
         return _0vj._1mE_(this.userId);
      }
      
      public function _00Z_() : String
      {
         return this._1iN_._0mw();
      }
      
      public function _L_y() : String
      {
         return _1R_H_;
      }
      
      public function _0fT_() : String
      {
         return "steam";
      }
      
      public function _rO_(param1:String, param2:int) : void
      {
         this._1iN_._1P_s(param1,param2);
      }
      
      public function _2R_() : String
      {
         return "/steamworks";
      }
      
      public function _1jd() : String
      {
         return "steamworks";
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
         throw new Error("No current support for new Kabam offer wall on Steam.");
      }
      
      public function _1e0() : String
      {
         throw new Error("No current support for new Kabam offer wall on Steam.");
      }
   }
}
