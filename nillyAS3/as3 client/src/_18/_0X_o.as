package _18
{
   import _P_S_.Mediator;
   import _K_r._1V_v;
   import _05g._0O_3;
   import com.company.assembleegameclient.objects.Player;
   import flash.events.MouseEvent;
   
   public class _0X_o extends Mediator
   {
       
      
      [Inject]
      public var view:_18._0I_h;
      
      [Inject]
      public var _E_:_1V_v;
      
      [Inject]
      public var _01C_:_18._0as;
      
      [Inject]
      public var _M_I_:_0O_3;
      
      public function _0X_o()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._19r.add(this._0wo);
         this._E_.add(this._E_5);
         this._M_I_.add(this._0vX_);
      }
      
      override public function destroy() : void
      {
         this.view._19r.remove(this._0wo);
         this._E_.remove(this._E_5);
      }
      
      private function _E_5(param1:Player) : void
      {
         this.view.draw(param1);
      }
      
      private function _0wo(param1:MouseEvent) : void
      {
         if(this.view._0h6 == _18._0I_h._0i0)
         {
            this.view._0W_T_();
            this._01C_.dispatch(this.view);
         }
      }
      
      private function _0vX_() : void
      {
         this.view._0E_E_();
      }
   }
}
