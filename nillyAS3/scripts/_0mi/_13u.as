package _0mi
{
   import flash.display.Sprite;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.utils.getTimer;
   import kabam.rotmg.assets.Assets;
   
   public class _13u extends Sprite
   {
       
      
      public const _0jB_:DisplayObject = new Assets.StarburstSpinner();
      
      public var _ds:Number;
      
      private var _A_u:Number;
      
      private var _J_0:Number;
      
      public function _13u()
      {
         super();
         this._A_u = 0;
         this._0A_W_();
         this._02h();
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         addEventListener(Event.REMOVED_FROM_STAGE,this._014);
      }
      
      private function _0A_W_() : void
      {
         this._ds = 50;
      }
      
      private function _02h() : void
      {
         addChild(this._0jB_);
         this._0jB_.x = -1 * width / 2;
         this._0jB_.y = -1 * height / 2;
      }
      
      private function _014(param1:Event) : void
      {
         removeEventListener(Event.REMOVED_FROM_STAGE,this._014);
         removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         this._0pP_();
         rotation = this._ds * this._A_u % 360;
      }
      
      private function _0pP_() : void
      {
         var _loc1_:Number = getTimer() / 1000;
         if(this._J_0)
         {
            this._A_u = this._A_u + (_loc1_ - this._J_0);
         }
         this._J_0 = _loc1_;
      }
   }
}
