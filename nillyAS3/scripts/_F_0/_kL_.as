package _F_0
{
   import _P_S_.Mediator;
   import _3b.DialogSignalNoDim;
   import _3b.DialogSignal;
   import flash.events.MouseEvent;
   import flash.events.KeyboardEvent;
   import com.company.assembleegameclient.parameters.Parameters;
   
   public class _kL_ extends Mediator
   {
       
      
      [Inject]
      public var view:_F_0._0E_r;
      
      [Inject]
      public var _Y_Q_:DialogSignalNoDim;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      public function _kL_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.init();
         if(!_1O_0._T_0)
         {
            this.view._A_d.addEventListener(MouseEvent.CLICK,this._0my);
            WebMain.stage_.addEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
         }
         else
         {
            TinkerView.closed.add(this._15b);
         }
      }
      
      override public function destroy() : void
      {
         TinkerView.closed.remove(this._15b);
         this.view._A_d.removeEventListener(MouseEvent.CLICK,this._0my);
         WebMain.stage_.removeEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
         super.destroy();
      }
      
      protected function _0my(param1:MouseEvent) : void
      {
         if(!_1O_0._T_0)
         {
            this._Y_Q_.dispatch(new _1O_0());
            this.view._A_d.removeEventListener(MouseEvent.CLICK,this._0my);
            WebMain.stage_.removeEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
            TinkerView.closed.add(this._15b);
         }
      }
      
      private function _15b() : void
      {
         TinkerView.closed.remove(this._15b);
         this.view._A_d.addEventListener(MouseEvent.CLICK,this._0my);
         WebMain.stage_.addEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
      }
      
      private function _1I_P_(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Parameters.data_.interact && WebMain.stage_.focus == null)
         {
            this._0my(null);
         }
      }
   }
}
