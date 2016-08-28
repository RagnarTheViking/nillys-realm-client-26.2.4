package _1xh
{
   import flash.display.Sprite;
   import flash.display.DisplayObjectContainer;
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.events.Event;
   
   public class _1T_5 extends Sprite
   {
       
      
      private var background:Sprite;
      
      private var container:DisplayObjectContainer;
      
      private var _0P_7:Sprite;
      
      private var _6q:DisplayObject;
      
      public function _1T_5()
      {
         super();
         addChild(this.background = new Sprite());
         addChild(this.container = new Sprite());
         this.background.visible = false;
         this.background.mouseEnabled = true;
      }
      
      public function _jO_(param1:int = 1381653) : void
      {
         var _loc2_:Graphics = this.background.graphics;
         _loc2_.clear();
         _loc2_.beginFill(param1,0.6);
         _loc2_.drawRect(0,0,800,600);
         _loc2_.endFill();
         this.background.visible = true;
      }
      
      public function show(param1:Sprite, param2:Boolean) : void
      {
         this._bE_();
         this._0mX_(param1);
         param2 && this._jO_();
      }
      
      public function _J_O_() : void
      {
         this.background.visible = false;
         this._bE_();
      }
      
      public function push(param1:Sprite) : void
      {
         this._0P_7.visible = false;
         this._6q = param1;
         addChild(param1);
         this.background.visible = true;
      }
      
      public function _1s3() : DisplayObject
      {
         return this._6q;
      }
      
      public function pop() : void
      {
         removeChild(this._6q);
         this._0P_7.visible = true;
      }
      
      private function _0mX_(param1:Sprite) : void
      {
         this._0P_7 = param1;
         param1.addEventListener(Event.REMOVED,this._014);
         this.container.addChild(param1);
      }
      
      private function _014(param1:Event) : void
      {
         var _loc2_:Sprite = param1.target as Sprite;
         if(this._0P_7 == _loc2_)
         {
            this.background.visible = false;
            this._0P_7 = null;
         }
      }
      
      private function _bE_() : void
      {
         if(this._0P_7 && this.container.contains(this._0P_7))
         {
            this._0P_7.removeEventListener(Event.REMOVED,this._014);
            this.container.removeChild(this._0P_7);
            this.background.visible = false;
         }
      }
   }
}
