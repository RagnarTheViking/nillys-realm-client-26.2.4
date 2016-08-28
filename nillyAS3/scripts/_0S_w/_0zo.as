package _0S_w
{
   import flash.display.Sprite;
   import com.company.util.IntPoint;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.display.Graphics;
   
   public class _0zo extends Sprite
   {
       
      
      public var tiles_:Vector.<IntPoint>;
      
      private var _1E_A_:Shape;
      
      private var _0Y_Z_:_0S_w._0P_c;
      
      public function _0zo(param1:Vector.<IntPoint>, param2:String)
      {
         super();
         this.tiles_ = param1;
         this._1E_A_ = new Shape();
         var _loc3_:Graphics = this._1E_A_.graphics;
         _loc3_.clear();
         _loc3_.beginFill(0,0.8);
         _loc3_.drawRect(0,0,800,600);
         _loc3_.endFill();
         addChild(this._1E_A_);
         this._0Y_Z_ = new _0S_w._0P_c(param2);
         this._0Y_Z_.addEventListener(Event.COMPLETE,this.onComplete);
         this._0Y_Z_.addEventListener(Event.CANCEL,this.onCancel);
         addChild(this._0Y_Z_);
      }
      
      public function _0F_L_() : String
      {
         if(this._0Y_Z_._g5.text() == "")
         {
            return null;
         }
         return this._0Y_Z_._g5.text();
      }
      
      public function onComplete(param1:Event) : void
      {
         dispatchEvent(new Event(Event.COMPLETE));
         parent.removeChild(this);
      }
      
      public function onCancel(param1:Event) : void
      {
         parent.removeChild(this);
      }
   }
}
