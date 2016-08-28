package _0E_n
{
   import flash.display.Sprite;
   import flash.display.DisplayObjectContainer;
   import _1A_k._J_D_;
   import _1xh._1T_5;
   
   public class _jE_ extends Sprite
   {
       
      
      private var menu:_0E_n._1X_U_;
      
      public var _vj:DisplayObjectContainer;
      
      private var tooltips:_J_D_;
      
      public var top:DisplayObjectContainer;
      
      public var _0su:DisplayObjectContainer;
      
      private var dialogs:_1T_5;
      
      public var _1iN_:DisplayObjectContainer;
      
      public var console:DisplayObjectContainer;
      
      public function _jE_()
      {
         super();
         addChild(this.menu = new _0E_n._1X_U_());
         addChild(this._vj = new Sprite());
         addChild(this.top = new Sprite());
         addChild(this._0su = new Sprite());
         this._0su.mouseEnabled = false;
         addChild(this.dialogs = new _1T_5());
         addChild(this.tooltips = new _J_D_());
         addChild(this._1iN_ = new Sprite());
         addChild(this.console = new Sprite());
      }
   }
}
