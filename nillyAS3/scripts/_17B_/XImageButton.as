package _17B_
{
   import flash.display.Sprite;
   import _f7.Signal;
   import flash.events.MouseEvent;
   import flash.display.DisplayObject;
   
   public class XImageButton extends Sprite
   {
      
      public static var _1J_I_:Class = _03z;
      
      public static var _rF_:Class = _0vr;
       
      
      public const clicked:Signal = new Signal();
      
      public var disabled:Boolean = false;
      
      public function XImageButton(param1:Number = -1)
      {
         var _loc2_:DisplayObject = null;
         super();
         if(param1 < 0)
         {
            addChild(new _1J_I_());
         }
         else
         {
            _loc2_ = new _rF_();
            addChild(new _rF_());
            scaleX = scaleX * param1;
            scaleY = scaleY * param1;
         }
         buttonMode = true;
         addEventListener(MouseEvent.CLICK,this.btnClicked);
      }
      
      public function _1X_u(param1:Boolean) : void
      {
         this.disabled = param1;
         if(param1)
         {
            removeEventListener(MouseEvent.CLICK,this.btnClicked);
         }
         else
         {
            addEventListener(MouseEvent.CLICK,this.btnClicked);
         }
      }
      
      public function _0P_n() : void
      {
         this.disabled = true;
         removeEventListener(MouseEvent.CLICK,this.btnClicked);
      }
      
      private function btnClicked(param1:MouseEvent) : void
      {
         if(!this.disabled)
         {
            this.clicked.dispatch();
            removeEventListener(MouseEvent.CLICK,this.btnClicked);
         }
      }
   }
}
