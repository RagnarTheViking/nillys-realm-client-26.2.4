package Frames
{
   import _P_S_.Mediator;
   import _3b.CloseDialogsSignal;
   import _1T_4._1yM_;
   import _K_r._0J_h;
   import com.company.assembleegameclient.game.GameSpriteBase;
   import _1iT_._0L_n;
   import _0H_w._1P_e;
   import com.company.assembleegameclient.parameters.Parameters;
   
   public class _k3 extends Mediator
   {
       
      
      [Inject]
      public var view:Frames._kW_;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      [Inject]
      public var trackEvent:_1yM_;
      
      [Inject]
      public var _X_l:_0J_h;
      
      private var _14O_:GameSpriteBase;
      
      private var name:String;
      
      public function _k3()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._14O_ = this.view._14O_;
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
         this._14O_.addEventListener(_0L_n.NAMERESULTEVENT,this._1yr);
         this._14O_.gsc_.chooseName(param1);
         this.view.disable();
      }
      
      public function _1yr(param1:_0L_n) : void
      {
         this._14O_.removeEventListener(_0L_n.NAMERESULTEVENT,this._1yr);
         var _loc2_:Boolean = param1._0Q_Z_.success_;
         if(_loc2_)
         {
            this._L_b();
         }
         else
         {
            this._0fh(param1._0Q_Z_.errorText_);
         }
      }
      
      private function _L_b() : void
      {
         if(this.view._1V_Q_)
         {
            this._0F_2();
         }
         this._14O_.model.setName(this.name);
         this._14O_.map.player_.name_ = this.name;
         this.closeDialogs.dispatch();
         this._X_l.dispatch(this.name);
      }
      
      private function _0F_2() : void
      {
         var _loc1_:_1P_e = new _1P_e();
         _loc1_.category = "credits";
         _loc1_._19E_ = !!this._14O_.model.getConverted()?"buyConverted":"buy";
         _loc1_.label = "Name Change";
         _loc1_.value = Parameters._1p5;
         this.trackEvent.dispatch(_loc1_);
      }
      
      private function _0fh(param1:String) : void
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
