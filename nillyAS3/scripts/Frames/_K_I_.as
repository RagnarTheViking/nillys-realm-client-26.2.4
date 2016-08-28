package Frames
{
   import _P_S_.Mediator;
   import _0J_8.MoneyFrame;
   import _1V_8._1ks;
   import _1V_8._jw;
   import _m2._c;
   import _3b.DialogSignal;
   import _3b.CloseDialogsSignal;
   import _1T_4._0zP_;
   import _0R_R_._0T_p;
   import _1__8._19A_;
   import _S_b._O_e;
   import _04h._1Q_v;
   import _0pN_._1nd;
   import _1O_R_.ErrorDialog;
   import _1U_P_.ContinueOrQuitDialog;
   import com.company.assembleegameclient.util.offer.Offer;
   
   public class _K_I_ extends Mediator
   {
       
      
      [Inject]
      public var view:MoneyFrame;
      
      [Inject]
      public var model:_1ks;
      
      [Inject]
      public var config:_jw;
      
      [Inject]
      public var _0mK_:_c;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      [Inject]
      public var _19M_:_0zP_;
      
      [Inject]
      public var _U_I_:_0T_p;
      
      [Inject]
      public var _0G_2:_19A_;
      
      [Inject]
      public var _1tf:_O_e;
      
      [Inject]
      public var _1xI_:_1Q_v;
      
      public function _K_I_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.buyNow.add(this._17Y_);
         this.view.cancel.add(this.onCancel);
         this._19M_.addOnce(this._N_k);
         this._1vZ_();
      }
      
      private function _1vZ_() : void
      {
         if(this.model._M_2)
         {
            this.view.initialize(this.model._M_2,this.config);
         }
         else
         {
            this._qS_();
         }
      }
      
      private function _qS_() : void
      {
         this._U_I_._0P_3.addOnce(this._1F_6);
         this._U_I_.start();
      }
      
      private function _1F_6(param1:_1nd, param2:Boolean, param3:String = "") : void
      {
         if(param2)
         {
            this.view.initialize(this.model._M_2,this.config);
         }
         else
         {
            this._06Z_.dispatch(new ErrorDialog("Unable to get gold offer information"));
         }
      }
      
      override public function destroy() : void
      {
         if(this._1tf._14O_.map.name_ == "Arena")
         {
            this._06Z_.dispatch(new ContinueOrQuitDialog(this._1xI_._O_h,true));
         }
         this.view.buyNow.add(this._17Y_);
         this.view.cancel.add(this.onCancel);
      }
      
      protected function _17Y_(param1:Offer, param2:String) : void
      {
         this._0G_2.info("offer {0}, paymentMethod {1}",[param1,param2]);
         this._0mK_.dispatch(param1,param2);
      }
      
      protected function _N_k() : void
      {
         this.view._T_j();
      }
      
      protected function onCancel() : void
      {
         this.closeDialogs.dispatch();
      }
   }
}
