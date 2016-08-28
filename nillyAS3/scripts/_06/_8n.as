package _06
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _5B_._1I_N_;
   import _1S_0.NativeMappedSignal;
   import flash.events.MouseEvent;
   import com.company.assembleegameclient.util._0lH_;
   import _1tU_._qq;
   
   public class _8n extends Sprite
   {
      
      public static var _0E_F_:Class = _01E_;
       
      
      public var close:Signal;
      
      public var select:_1I_N_;
      
      public var _0p__:Sprite;
      
      public var _B_Y_:Sprite;
      
      public var google:Sprite;
      
      public function _8n()
      {
         super();
         this.close = new Signal();
         this.select = new _1I_N_(MouseEvent.CLICK,String);
         this._1L_c();
         this._C_r();
         this._U_x();
      }
      
      public function _17D_() : void
      {
         stage;
         x = (800 - width) * 0.5;
         stage;
         y = (600 - height) * 0.5 - 5;
      }
      
      private function _1L_c() : void
      {
         addChild(new _0E_F_());
      }
      
      private function _C_r() : void
      {
         var _loc1_:Sprite = this._vI_(550,30,30,30);
         this.close = new NativeMappedSignal(_loc1_,MouseEvent.CLICK);
      }
      
      private function _U_x() : void
      {
         this._0p__ = this._vI_(220,180,180,35);
         this._B_Y_ = this._vI_(220,224,180,35);
         this.google = this._vI_(220,268,180,35);
         this.select.map(this._0p__,_0lH_._13B_.label_);
         this.select.map(this._B_Y_,_0lH_._03u.label_);
         this.select.map(this.google,_0lH_._7G_.label_);
      }
      
      private function _vI_(param1:int, param2:int, param3:int, param4:int) : Sprite
      {
         var _loc5_:_qq = new _qq(param1,param2,param3,param4);
         addChild(_loc5_);
         return _loc5_;
      }
   }
}
