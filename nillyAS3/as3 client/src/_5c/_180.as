package _5c
{
   import _0pN_._049;
   import _0R_R_._1tP_;
   import _4u.Account;
   import _aW_.IWebRequest;
   import _0O_c._H_0;
   import flash.net.SharedObject;
   import _0pN_._1nd;
   import com.company.assembleegameclient.util.GUID;
   
   public class _180 extends _049 implements _1tP_
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var client:IWebRequest;
      
      private var data:_H_0;
      
      public function _180()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this._jg();
         if(this.data.username)
         {
            this._0qt();
         }
         else
         {
            this._0H_c();
         }
      }
      
      private function _jg() : void
      {
         var rotmg:SharedObject = null;
         this.data = new _H_0();
         try
         {
            rotmg = SharedObject.getLocal("nRotMG","/");
            rotmg.data["GUID"] && (this.data.username = rotmg.data["GUID"]);
            rotmg.data["Password"] && (this.data.password = rotmg.data["Password"]);
            return;
         }
         catch(error:Error)
         {
            data.username = null;
            data.password = null;
            return;
         }
      }
      
      private function _0qt() : void
      {
         var _loc1_:_0p2 = new _0p2();
         _loc1_.account = this.account;
         _loc1_.client = this.client;
         _loc1_.data = this.data;
         _loc1_._0P_3.addOnce(this._0lm);
         _loc1_.start();
      }
      
      private function _0lm(param1:_1nd, param2:Boolean, param3:String = "") : void
      {
         _0et(true);
      }
      
      private function _0H_c() : void
      {
         this.account._0cX_(GUID.create(),null);
         _0et(true);
      }
   }
}
