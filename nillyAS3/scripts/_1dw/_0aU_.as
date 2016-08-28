package _1dw
{
   import flash.display.Sprite;
   import _0J_8._0C_M_;
   import _1gF_.SimpleText;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFieldAutoSize;
   import _1xa._dU_;
   import _C_._1O_I_;
   
   public class _0aU_ extends Sprite implements _0C_M_
   {
      
      private static const _Z_B_:int = 18;
       
      
      private var _T_M_:SimpleText;
      
      private var userName:String = "";
      
      private var _09g:Boolean;
      
      public function _0aU_()
      {
         super();
         this._continue();
      }
      
      private function _continue() : void
      {
         this._T_M_ = new SimpleText().setSize(_Z_B_).setColor(11776947);
         this._T_M_.filters = [new DropShadowFilter(0,0,0,1,4,4)];
         this._T_M_.setAutoSize(TextFieldAutoSize.RIGHT);
         addChild(this._T_M_);
      }
      
      public function _G_z(param1:String, param2:Boolean) : void
      {
         this.userName = param1;
         this._09g = param2;
         this._T_M_.setStringBuilder(new _dU_().setParams(_1O_I_._0S_B_,{"userName":param1}));
      }
   }
}
