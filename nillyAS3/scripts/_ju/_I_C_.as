package _ju
{
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   import com.company.assembleegameclient.map.Map;
   import com.company.util.IntPoint;
   import com.company.assembleegameclient.map.View;
   import flash.events.Event;
   import flash.utils.getTimer;
   import com.company.assembleegameclient.game.Cursor;
   import _ll.Music;
   import flash.utils.ByteArray;
   import _0O_P_._W_6;
   import _05G_.Background;
   
   public class _I_C_ extends Sprite
   {
      
      private static const BORDER:int = 10;
      
      private static const _0rR_:Rectangle = new Rectangle(-400,-300,800,600);
      
      private static const _0U_t:Number = 7 * Math.PI / 4;
      
      private static const _1X_t:Number = 1 / 1000;
      
      private static const _18u:Class = _0gD_;
      
      private static var _1P_P_:Map;
      
      private static var _0mh:IntPoint;
      
      private static var _il:Number;
      
      private static var _06Q_:Number;
      
      private static var camera:View;
       
      
      private var _0wg:int;
      
      private var time:Number;
      
      public function _I_C_()
      {
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         addChildAt(_1P_P_ = _1P_P_ || this._05N_(),0);
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         this._0wg = getTimer();
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         Cursor.setMouseIcon(true);
         if(Music.musicTrack != "Menu2")
         {
            if(Music.musicTrack != "Dead")
            {
               Music.Load();
            }
         }
         Music.UpdateFade();
         this.time = getTimer();
         _il = _il + (this.time - this._0wg) * _1X_t;
         if(_il > _0mh.x_ + BORDER)
         {
            _il = _il - _0mh.x_;
         }
         camera.configure(_il,_06Q_,12,_0U_t,_0rR_);
         _1P_P_.draw(camera,this.time);
         this._0wg = this.time;
      }
      
      private function _05N_() : Map
      {
         var _loc1_:ByteArray = new _18u();
         var _loc2_:String = _loc1_.readUTFBytes(_loc1_.length);
         _0mh = _W_6._1X_Q_(_loc2_);
         _il = BORDER;
         _06Q_ = BORDER + int((_0mh.y_ - 2 * BORDER) * Math.random());
         camera = new View();
         var _loc3_:Map = new Map(null);
         _loc3_.setProps(_0mh.x_ + 2 * BORDER,_0mh.y_,"Background Map",Background._01f,false,false);
         _loc3_.initialize();
         _W_6._1iv(_loc2_,_loc3_,0,0);
         _W_6._1iv(_loc2_,_loc3_,_0mh.x_,0);
         return _loc3_;
      }
   }
}
