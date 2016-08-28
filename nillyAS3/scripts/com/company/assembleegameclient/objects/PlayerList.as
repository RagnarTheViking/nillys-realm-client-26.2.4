package com.company.assembleegameclient.objects
{
   import com.company.assembleegameclient.map.Map;
   import flash.utils.Dictionary;
   import com.company.util.PointUtil;
   import Packets.Server.AccountList;
   
   public class PlayerList
   {
      
      public static const MaxCount:int = 6;
      
      private static const SortParameters:Array = ["starred_","distSqFromThisPlayer_","objectId_"];
      
      private static const SortTypes:Array = [Array.NUMERIC | Array.DESCENDING,Array.NUMERIC,Array.NUMERIC];
      
      private static const MaxSqrDist:int = 50 * 50;
       
      
      public var map_:Map;
      
      public var players:Array;
      
      private var starred_:Dictionary;
      
      private var ignored_:Dictionary;
      
      private var lastUpdate_:int = -2.147483648E9;
      
      public function PlayerList(param1:Map)
      {
         this.players = [];
         this.starred_ = new Dictionary(true);
         this.ignored_ = new Dictionary(true);
         super();
         this.map_ = param1;
      }
      
      public function update(param1:int, param2:int) : void
      {
         var _loc4_:GameObject = null;
         var _loc5_:Player = null;
         if(param1 < this.lastUpdate_ + 500)
         {
            return;
         }
         this.lastUpdate_ = param1;
         this.players.length = 0;
         var _loc3_:Player = this.map_.player_;
         if(_loc3_ == null)
         {
            return;
         }
         for each(_loc4_ in this.map_.goDict_)
         {
            _loc5_ = _loc4_ as Player;
            if(_loc5_ != null && _loc5_ != _loc3_)
            {
               _loc5_.starred_ = this.starred_[_loc5_.accountId_] != undefined;
               _loc5_.ignored_ = this.ignored_[_loc5_.accountId_] != undefined;
               _loc5_.distSqFromThisPlayer_ = PointUtil.getDistanceSqr(_loc3_.x_,_loc3_.y_,_loc5_.x_,_loc5_.y_);
               if(_loc5_.distSqFromThisPlayer_ < MaxSqrDist || _loc5_.starred_)
               {
                  this.players.push(_loc5_);
               }
            }
         }
         this.players.sortOn(SortParameters,SortTypes);
         if(this.players.length > MaxCount)
         {
            this.players.length = MaxCount;
         }
      }
      
      public function setLock(param1:Player) : void
      {
         this.starred_[param1.accountId_] = 1;
         this.lastUpdate_ = int.MIN_VALUE;
         this.map_.gs_.gsc_.editAccountList(0,true,param1.objectId_);
      }
      
      public function removeLock(param1:Player) : void
      {
         delete this.starred_[param1.accountId_];
         param1.starred_ = false;
         this.lastUpdate_ = int.MIN_VALUE;
         this.map_.gs_.gsc_.editAccountList(0,false,param1.objectId_);
      }
      
      public function setLocks(param1:AccountList) : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         while(_loc3_ < param1.accountIds_.length)
         {
            _loc2_ = param1.accountIds_[_loc3_];
            this.starred_[_loc2_] = 1;
            this.lastUpdate_ = int.MIN_VALUE;
            _loc3_++;
         }
      }
      
      public function removeLocks(param1:AccountList) : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         while(_loc3_ < param1.accountIds_.length)
         {
            _loc2_ = param1.accountIds_[_loc3_];
            delete this.starred_[_loc2_];
            this.lastUpdate_ = int.MIN_VALUE;
            _loc3_++;
         }
      }
      
      public function setIgnore(param1:Player) : void
      {
         this.ignored_[param1.accountId_] = 1;
         this.lastUpdate_ = int.MIN_VALUE;
         this.map_.gs_.gsc_.editAccountList(1,true,param1.objectId_);
      }
      
      public function removeIgnore(param1:Player) : void
      {
         delete this.ignored_[param1.accountId_];
         param1.ignored_ = false;
         this.lastUpdate_ = int.MIN_VALUE;
         this.map_.gs_.gsc_.editAccountList(1,false,param1.objectId_);
      }
      
      public function setIgnores(param1:AccountList) : void
      {
         var _loc3_:String = null;
         var _loc2_:int = 0;
         this.ignored_ = new Dictionary(true);
         while(_loc2_ < param1.accountIds_.length)
         {
            _loc3_ = param1.accountIds_[_loc2_];
            this.ignored_[_loc3_] = 1;
            this.lastUpdate_ = int.MIN_VALUE;
            _loc2_++;
         }
      }
   }
}
