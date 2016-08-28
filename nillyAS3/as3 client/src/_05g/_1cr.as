package _05g
{
   import _P_S_.Mediator;
   import _S_b._O_e;
   import _K_r._1V_v;
   import _18._0as;
   import flash.display.Sprite;
   import _18._0I_h;
   import flash.events.MouseEvent;
   import com.company.assembleegameclient.objects.Player;
   
   public class _1cr extends Mediator
   {
       
      
      [Inject]
      public var view:_05g.UserHud;
      
      [Inject]
      public var _1tf:_O_e;
      
      [Inject]
      public var _E_:_1V_v;
      
      [Inject]
      public var _01C_:_0as;
      
      [Inject]
      public var _M_I_:_05g._0O_3;
      
      private var stats:Sprite;
      
      public function _1cr()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._E_.addOnce(this._10Z_);
         this._E_.add(this._E_5);
         this._01C_.add(this._1A_7);
      }
      
      private function _1A_7(param1:_0I_h) : void
      {
         this.stats = param1;
         this.view.addChild(param1);
         param1.x = this.view.mouseX - param1.width / 2;
         param1.y = this.view.mouseY - param1.height / 2;
         this._0ic(param1);
      }
      
      private function _0ic(param1:_0I_h) : void
      {
         param1.startDrag();
         param1.addEventListener(MouseEvent.MOUSE_UP,this._1S_X_);
      }
      
      private function _1S_X_(param1:MouseEvent) : void
      {
         var _loc2_:Sprite = _0I_h(param1.target);
         this._S_S_(_loc2_);
         if(_loc2_.hitTestObject(this.view._0Y_x))
         {
            this._0M_m(_loc2_);
         }
      }
      
      private function _0M_m(param1:Sprite) : void
      {
         this._M_I_.dispatch();
         this.view.removeChild(param1);
         param1.stopDrag();
      }
      
      private function _S_S_(param1:Sprite) : void
      {
         param1.removeEventListener(MouseEvent.MOUSE_UP,this._1S_X_);
         param1.addEventListener(MouseEvent.MOUSE_DOWN,this._0N_h);
         param1.stopDrag();
      }
      
      private function _0N_h(param1:MouseEvent) : void
      {
         var _loc2_:Sprite = Sprite(param1.target);
         this.stats = _loc2_;
         _loc2_.removeEventListener(MouseEvent.MOUSE_DOWN,this._0N_h);
         _loc2_.addEventListener(MouseEvent.MOUSE_UP,this._1S_X_);
         _loc2_.startDrag();
      }
      
      override public function destroy() : void
      {
         this._E_.remove(this._E_5);
         this._01C_.remove(this._1A_7);
         if(this.stats && this.stats.hasEventListener(MouseEvent.MOUSE_DOWN))
         {
            this.stats.removeEventListener(MouseEvent.MOUSE_DOWN,this._0N_h);
         }
      }
      
      private function _E_5(param1:Player) : void
      {
         this.view.draw();
      }
      
      private function _10Z_(param1:Player) : void
      {
         this.view._c3(this._1tf._14O_);
      }
   }
}
