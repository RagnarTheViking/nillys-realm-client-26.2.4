package _1U_P_
{
   import _P_S_.Mediator;
   import _0Z_d._ee;
   import _04h._1Q_v;
   import _04h._1L_l;
   import _3b.DialogSignal;
   import flash.utils.Timer;
   import _04h._083;
   import flash.events.TimerEvent;
   
   public class _dz extends Mediator
   {
       
      
      [Inject]
      public var view:_1U_P_.BattleSummaryDialog;
      
      [Inject]
      public var _0A_r:_ee;
      
      [Inject]
      public var _1A_A_:_1Q_v;
      
      [Inject]
      public var _033:_1L_l;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      private var _1N_8:Timer;
      
      public function _dz()
      {
         this._1N_8 = new Timer(800,1);
         super();
      }
      
      override public function initialize() : void
      {
         this.view.visible = false;
         this.view._9s();
         this.view._gt(this._1A_A_._0P_9.arenaWave,this._1A_A_._0P_9.arenaTime);
         var _loc1_:Boolean = this._033._0P_9.arenaWave > this._1A_A_._0P_9.arenaWave || this._033._0P_9.arenaWave == this._1A_A_._0P_9.arenaWave && this._033._0P_9.arenaTime < this._1A_A_._0P_9.arenaTime;
         var _loc2_:_083 = !!_loc1_?this._033._0P_9:this._1A_A_._0P_9;
         this.view._1sV_(_loc2_.arenaWave,_loc2_.arenaTime);
         this.view.close.add(this._fH_);
         this._0A_r.addOnce(this._xu);
      }
      
      private function _fH_() : void
      {
         this._06Z_.dispatch(new ArenaLeaderboard());
      }
      
      private function _xu() : void
      {
         this._1N_8.addEventListener(TimerEvent.TIMER,this._J_Y_);
         this._1N_8.start();
      }
      
      private function _J_Y_(param1:TimerEvent) : void
      {
         this._1N_8.removeEventListener(TimerEvent.TIMER,this._J_Y_);
         this.view.visible = true;
      }
      
      override public function destroy() : void
      {
         this.view.close.remove(this._fH_);
      }
   }
}
