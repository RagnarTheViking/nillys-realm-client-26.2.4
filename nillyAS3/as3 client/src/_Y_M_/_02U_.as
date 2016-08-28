package _Y_M_
{
   import com.company.assembleegameclient.ui._1vJ_;
   import com.company.assembleegameclient.map._76;
   import com.company.assembleegameclient.objects.Player;
   import com.company.assembleegameclient.ui._0fL_;
   import _f7.Signal;
   import flash.events.MouseEvent;
   import flash.events.Event;
   
   public class _02U_ extends Menu
   {
       
      
      private var _dY_:Vector.<_1vJ_>;
      
      private var _1M_S_:uint = 4;
      
      public var map_:_76;
      
      public var _06v:Vector.<Player>;
      
      public var _H_K_:_Y_M_.MenuItem;
      
      public var _0sc:_0fL_;
      
      public var _1l8:Signal;
      
      public function _02U_(param1:_76, param2:Vector.<Player>)
      {
         this._dY_ = new Vector.<_1vJ_>();
         this._1l8 = new Signal();
         super(3552822,16777215);
         this.map_ = param1;
         this._06v = param2.concat();
         this._1R___();
         this._l6();
      }
      
      private function _l6() : void
      {
         var _loc1_:Player = null;
         var _loc2_:_1vJ_ = null;
         for each(_loc1_ in this._06v)
         {
            _loc2_ = new _1vJ_(11776947,true,_loc1_);
            _loc2_.x = 0;
            _loc2_.y = this._1M_S_;
            addChild(_loc2_);
            this._dY_.push(_loc2_);
            this._1M_S_ = this._1M_S_ + 32;
         }
      }
      
      private function _1R___() : void
      {
         if(this.map_.allowTeleport())
         {
            this._H_K_ = new TeleportMenuOption(this.map_.player_);
            this._H_K_.x = 8;
            this._H_K_.y = 8;
            this._H_K_.addEventListener(MouseEvent.CLICK,this._1J_n);
            addChild(this._H_K_);
            this._0sc = new _0fL_(150,1842204);
            this._0sc.x = 6;
            this._0sc.y = 40;
            addChild(this._0sc);
            this._1M_S_ = 52;
         }
      }
      
      private function _1J_n(param1:Event) : void
      {
         var _loc2_:Player = null;
         var _loc4_:Player = null;
         var _loc3_:Player = this.map_.player_;
         for each(_loc2_ in this._06v)
         {
            if(_loc3_._D_a(_loc2_))
            {
               _loc4_ = _loc2_;
               break;
            }
         }
         if(_loc4_ != null)
         {
            _loc3_.teleport(_loc4_);
         }
         else
         {
            this._1l8.dispatch();
         }
         remove();
      }
   }
}
