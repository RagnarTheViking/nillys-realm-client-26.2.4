package _1U_P_
{
   import _P_S_.Mediator;
   import _1lY_._0D_i;
   import _1lY_._1m;
   import flash.utils.Timer;
   import flash.events.TimerEvent;
   
   public class _0T_5 extends Mediator
   {
       
      
      [Inject]
      public var view:_1U_P_._02M_;
      
      [Inject]
      public var _V_p:_0D_i;
      
      [Inject]
      public var _0hq:_1m;
      
      private var _B_r:Timer;
      
      public function _0T_5()
      {
         this._B_r = new Timer(6000);
         super();
      }
      
      override public function initialize() : void
      {
         this._V_p.add(this._h5);
         this._0hq.add(this._1V_D_);
         this._B_r.addEventListener(TimerEvent.TIMER,this._1q8);
      }
      
      override public function destroy() : void
      {
         this._V_p.remove(this._h5);
         this._0hq.remove(this._1V_D_);
         this.view.stop();
      }
      
      private function _1V_D_() : void
      {
         this.view.stop();
      }
      
      private function _1q8(param1:TimerEvent) : void
      {
         this._B_r.stop();
         this.view.start();
         this.view.x = 300 - this.view.width / 2;
      }
      
      private function _h5(param1:int, param2:int) : void
      {
         this._B_r.start();
         this.view.stop();
      }
   }
}
