package _05g
{
   import _P_S_.Mediator;
   import _S_b._O_e;
   import _K_r._1V_v;
   import com.company.assembleegameclient.objects.Player;
   
   public class _0l4 extends Mediator
   {
       
      
      [Inject]
      public var view:_05g._0F_q;
      
      [Inject]
      public var _1tf:_O_e;
      
      [Inject]
      public var _E_:_1V_v;
      
      public function _0l4()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._E_.add(this._E_5);
      }
      
      override public function destroy() : void
      {
         this._E_.add(this._E_5);
      }
      
      private function _E_5(param1:Player) : void
      {
         this.view.update(param1);
      }
   }
}
