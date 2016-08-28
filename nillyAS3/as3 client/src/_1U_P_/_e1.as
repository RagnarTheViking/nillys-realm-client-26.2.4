package _1U_P_
{
   import _P_S_.Mediator;
   import _04h._1Q_v;
   
   public class _e1 extends Mediator
   {
       
      
      [Inject]
      public var view:_1U_P_._08Q_;
      
      [Inject]
      public var _1A_A_:_1Q_v;
      
      public function _e1()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._1A_A_._165.add(this._da);
      }
      
      override public function destroy() : void
      {
         this._1A_A_._165.remove(this._da);
      }
      
      private function _da() : void
      {
         this.view._E_j(this._1A_A_._0P_9.arenaWave);
      }
   }
}
