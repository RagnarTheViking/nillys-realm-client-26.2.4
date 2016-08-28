package _17B_
{
   import flash.display.Sprite;
   import _1R_o._Y_5;
   import _P_N_._1B_G_;
   import _1R_o._0xf;
   import flash.display.Bitmap;
   import _1F_z._1Z_D_;
   import flash.geom.ColorTransform;
   import flash.events.Event;
   import _1T_4._q6;
   import _1T_4._1K_2;
   
   public class _I_4 extends Sprite implements _Y_5, _1B_G_
   {
      
      public static const _0lv:uint = 2697513;
       
      
      public var _18D_:_0xf;
      
      private var _1t6:Bitmap;
      
      private var enabled:Boolean = true;
      
      private var petVO:_1Z_D_;
      
      public function _I_4(param1:_1Z_D_)
      {
         this._18D_ = new _0xf();
         super();
         this.petVO = param1;
         this._18D_._bD_(this);
         this._18D_.tooltip = new _18A_(param1);
      }
      
      public function disable() : void
      {
         var _loc1_:ColorTransform = new ColorTransform();
         _loc1_.color = _0lv;
         this._1t6.transform.colorTransform = _loc1_;
         this.enabled = false;
      }
      
      public function isEnabled() : Boolean
      {
         return this.enabled;
      }
      
      override public function dispatchEvent(param1:Event) : Boolean
      {
         if(this.enabled)
         {
            return super.dispatchEvent(param1);
         }
         return false;
      }
      
      public function _06K_(param1:Bitmap) : void
      {
         this._1t6 = param1;
         addChild(param1);
      }
      
      public function _0A_A_(param1:_q6) : void
      {
         this._18D_._0A_A_(param1);
      }
      
      public function _23() : _q6
      {
         return this._18D_._23();
      }
      
      public function _0hm(param1:_1K_2) : void
      {
         this._18D_._0hm(param1);
      }
      
      public function _fn() : _1K_2
      {
         return this._18D_._fn();
      }
      
      public function getPetVO() : _1Z_D_
      {
         return this.petVO;
      }
   }
}
