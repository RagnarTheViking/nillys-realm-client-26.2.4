package Frames
{
   import _P_S_.Mediator;
   import _4u.Account;
   import _3b.DialogSignal;
   import _3b.CloseDialogsSignal;
   import _K_r._0J_h;
   import _aW_.IWebRequest;
   import _v4.Client;
   import com.company.util._l5;
   
   public class _hL_ extends Mediator
   {
       
      
      [Inject]
      public var view:Frames.NewChooseNameFrame;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      [Inject]
      public var _X_l:_0J_h;
      
      [Inject]
      public var client:IWebRequest;
      
      [Inject]
      public var _0U_H_:Client;
      
      private var name:String;
      
      public function _hL_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.choose.add(this._E_J_);
         this.view.cancel.add(this.onCancel);
      }
      
      override public function destroy() : void
      {
         this.view.choose.remove(this._E_J_);
         this.view.cancel.remove(this.onCancel);
      }
      
      private function _E_J_(param1:String) : void
      {
         this.name = param1;
         if(param1.length < 1)
         {
            this.view._0gM_("Name too short");
         }
         else
         {
            this._H_U_();
         }
      }
      
      private function _H_U_() : void
      {
         var _loc1_:Object = {"name":this.name};
         _l5._0an(_loc1_,this.account.credentials());
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest("/account/setName",_loc1_);
         this.view.disable();
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         if(param1)
         {
            this._1H_V_();
         }
         else
         {
            this._10c(param2);
         }
      }
      
      private function _1H_V_() : void
      {
         if(this._0U_H_ != null)
         {
            this._0U_H_.setName(this.name);
         }
         this._X_l.dispatch(this.name);
         this.closeDialogs.dispatch();
      }
      
      private function _10c(param1:String) : void
      {
         this.view._0gM_(param1);
         this.view._0F_M_();
      }
      
      private function onCancel() : void
      {
         this.closeDialogs.dispatch();
      }
   }
}
