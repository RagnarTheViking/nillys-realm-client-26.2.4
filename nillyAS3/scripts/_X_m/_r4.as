package _X_m
{
   import _0pN_._049;
   import _03U_._51;
   import _03U_._1U_N_;
   import _3b.DialogSignal;
   import _aW_.IWebRequest;
   import _1O_R_.ErrorDialog;
   
   public class _r4 extends _049
   {
      
      private static const LANGUAGE:String = "LANGUAGE";
       
      
      [Inject]
      public var model:_51;
      
      [Inject]
      public var _0H_L_:_1U_N_;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var client:IWebRequest;
      
      private var language:String;
      
      public function _r4()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this.language = this.model._S_u();
         this.client.complete.addOnce(this.onComplete);
         this.client._R_L_(3);
         this.client.sendRequest("/app/getLanguageStrings",{"languageType":this.language});
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         if(param1)
         {
            this._1ai(param2);
         }
         else
         {
            this._08T_();
         }
         _0et(param1,param2);
      }
      
      private function _1ai(param1:String) : void
      {
         var _loc2_:Array = null;
         this._0H_L_.clear();
         var _loc3_:Object = JSON.parse(param1);
         for each(_loc2_ in _loc3_)
         {
            this._0H_L_.setValue(_loc2_[0],_loc2_[1],_loc2_[2]);
         }
      }
      
      private function _08T_() : void
      {
         this._0H_L_.setValue("ok","ok",this.model._S_u());
         var _loc1_:ErrorDialog = new ErrorDialog("Unable to connect to server.");
         this._06Z_.dispatch(_loc1_);
         _0et(false);
      }
   }
}
