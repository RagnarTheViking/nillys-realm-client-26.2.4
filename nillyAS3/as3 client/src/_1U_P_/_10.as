package _1U_P_
{
   import _P_S_.Mediator;
   import _0E_n._jE_;
   import _04h._1Q_v;
   import _0Z_d._ee;
   import _0Z_d._0wS_;
   import _0jo._1Y_r;
   import flash.utils.Timer;
   import flash.events.TimerEvent;
   
   public class _10 extends Mediator
   {
       
      
      [Inject]
      public var view:_1U_P_._18w;
      
      [Inject]
      public var _H_u:_jE_;
      
      [Inject]
      public var _1xI_:_1Q_v;
      
      [Inject]
      public var _0A_r:_ee;
      
      [Inject]
      public var _I_P_:_0wS_;
      
      [Inject]
      public var _0R_S_:_1Y_r;
      
      private var _1N_8:Timer;
      
      public function _10()
      {
         this._1N_8 = new Timer(800,1);
         super();
      }
      
      override public function initialize() : void
      {
         this._1N_8.addEventListener(TimerEvent.TIMER,this._0O_t);
         this._I_P_.add(this._0kJ_);
         this._0R_S_.add(this._0kJ_);
         this.view._E_j(this._1xI_._0P_9.arenaWave);
         this.view.close.addOnce(this._fH_);
         this.view.init();
         if(this._1xI_._0P_9.arenaWave == 1)
         {
            this._1N_8.start();
         }
         else
         {
            this.view.show();
         }
      }
      
      private function _0kJ_() : void
      {
         this.view.destroy();
         this._fH_();
      }
      
      override public function destroy() : void
      {
         this._1N_8.removeEventListener(TimerEvent.TIMER,this._0O_t);
         this._I_P_.remove(this._0kJ_);
         this._0R_S_.remove(this._0kJ_);
      }
      
      private function _1A_W_() : void
      {
         this._1N_8.start();
      }
      
      private function _0O_t(param1:TimerEvent) : void
      {
         this.view.show();
      }
      
      private function _fH_() : void
      {
         if(this._H_u._0su.contains(this.view))
         {
            this._H_u._0su.removeChild(this.view);
         }
      }
   }
}
