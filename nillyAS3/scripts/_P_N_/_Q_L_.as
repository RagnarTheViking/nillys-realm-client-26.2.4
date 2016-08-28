package _P_N_
{
   import flash.display.Sprite;
   import _17B_._I_4;
   import _1F_z._1Z_D_;
   
   public class _Q_L_ extends Sprite implements _1B_G_
   {
      
      public static const _px:String = "topLeft";
      
      public static const _1uo:String = "topRight";
      
      public static const _1E_4:String = "bottomRight";
      
      public static const _1z__:String = "bottomLeft";
      
      public static const _K_d:String = "regular";
      
      private static const _15D_:Array = [_px,_1uo,_1E_4,_1z__];
       
      
      public var _1d7:_P_N_._nu;
      
      private var _O_M_:_I_4;
      
      private var background:String;
      
      private var size:int;
      
      private var _B_0:_P_N_._vd;
      
      public function _Q_L_()
      {
         this._1d7 = new _P_N_._nu();
         super();
      }
      
      public function _0mr(param1:_I_4) : void
      {
         this._O_M_ = param1;
         addChild(param1);
      }
      
      public function disable() : void
      {
         this._O_M_.disable();
      }
      
      public function isEnabled() : Boolean
      {
         return this._O_M_.isEnabled();
      }
      
      public function setSize(param1:int) : void
      {
         this.size = param1;
      }
      
      public function _04o(param1:String) : void
      {
         this.background = param1;
         if(this._B_0)
         {
            removeChild(this._B_0);
         }
         this._B_0 = _vd(this._1d7.create(this.size,this._1l9()));
         addChildAt(this._B_0,0);
      }
      
      private function _1l9() : Array
      {
         var _loc1_:Array = [0,0,0,0];
         if(this.background != _K_d)
         {
            _loc1_[_15D_.indexOf(this.background)] = 1;
         }
         return _loc1_;
      }
      
      public function _H_f() : String
      {
         return this.background;
      }
      
      public function getPetVO() : _1Z_D_
      {
         return this._O_M_.getPetVO();
      }
   }
}
