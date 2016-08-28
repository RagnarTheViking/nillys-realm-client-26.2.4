package _0bE_
{
   import flash.display.Sprite;
   import com.company.assembleegameclient.map.Map;
   import flash.events.Event;
   import com.company.assembleegameclient.map.View;
   import com.company.assembleegameclient.objects.Player;
   import com.company.assembleegameclient.objects.PlayerList;
   
   public class PartyOverlay extends Sprite
   {
       
      
      public var map_:Map;
      
      public var _zY_:Vector.<_0bE_._1Q_n> = null;
      
      public var questArrow_:_0bE_._1rj;
      
      public function PartyOverlay(param1:Map)
      {
         var _loc2_:_0bE_._1Q_n = null;
         var _loc3_:int = 0;
         super();
         this.map_ = param1;
         this._zY_ = new Vector.<_0bE_._1Q_n>(PlayerList.MaxCount,true);
         while(_loc3_ < PlayerList.MaxCount)
         {
            _loc2_ = new _0bE_._1Q_n();
            this._zY_[_loc3_] = _loc2_;
            addChild(_loc2_);
            _loc3_++;
         }
         this.questArrow_ = new _0bE_._1rj(this.map_);
         addChild(this.questArrow_);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         _1Y_._4q();
      }
      
      public function draw(param1:View, param2:int) : void
      {
         var _loc3_:_0bE_._1Q_n = null;
         var _loc4_:Player = null;
         var _loc5_:int = 0;
         var _loc6_:_0bE_._1Q_n = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc11_:int = 0;
         if(this.map_.player_ == null)
         {
            return;
         }
         var _loc9_:PlayerList = this.map_.playerList_;
         var _loc10_:Player = this.map_.player_;
         while(_loc11_ < PlayerList.MaxCount)
         {
            _loc3_ = this._zY_[_loc11_];
            if(!_loc3_._0K_Q_)
            {
               if(_loc11_ >= _loc9_.players.length)
               {
                  _loc3_._1G_B_(null);
               }
               else
               {
                  _loc4_ = _loc9_.players[_loc11_];
                  if(_loc4_.isVisible || _loc4_.map_ == null || _loc4_.dying_)
                  {
                     _loc3_._1G_B_(null);
                  }
                  else
                  {
                     _loc3_._1G_B_(_loc4_);
                     _loc5_ = 0;
                     while(_loc5_ < _loc11_)
                     {
                        _loc6_ = this._zY_[_loc5_];
                        _loc7_ = _loc3_.x - _loc6_.x;
                        _loc8_ = _loc3_.y - _loc6_.y;
                        if(_loc7_ * _loc7_ + _loc8_ * _loc8_ < 64)
                        {
                           if(!_loc6_._0K_Q_)
                           {
                              _loc6_._1qY_(_loc4_);
                           }
                           _loc3_._1G_B_(null);
                           break;
                        }
                        _loc5_++;
                     }
                     _loc3_.draw(param2,param1);
                  }
               }
            }
            _loc11_++;
         }
         if(!this.questArrow_._0K_Q_)
         {
            this.questArrow_.draw(param2,param1);
         }
      }
   }
}
