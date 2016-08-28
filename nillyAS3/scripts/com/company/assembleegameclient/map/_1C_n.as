package com.company.assembleegameclient.map
{
   import com.company.assembleegameclient.objects.BasicObject;
   import flash.display.IGraphicsData;
   import flash.utils.Dictionary;
   import flash.events.Event;
   import flash.utils.getTimer;
   import com.company.assembleegameclient.objects.GameObject;
   import _0x1._G_Q_;
   import _7m._H_Q_;
   import _0x1.ConfettiEffect;
   import _0x1._1D_9;
   
   public class _1C_n extends Map
   {
      
      public static const _eY_:int = 1;
      
      public static const _G_A_:Number = 16;
       
      
      private var _0j8:Boolean = false;
      
      private var _0Z___:Vector.<BasicObject>;
      
      private var _kT_:Vector.<int>;
      
      private var _1T_S_:uint = 0;
      
      private var _xJ_:uint = 0;
      
      private var time:uint = 0;
      
      private var graphicsData_:Vector.<IGraphicsData>;
      
      public function _1C_n(param1:int = -1)
      {
         this._0Z___ = new Vector.<BasicObject>();
         this._kT_ = new Vector.<int>();
         this.graphicsData_ = new Vector.<IGraphicsData>();
         super(null);
         if(param1 == _eY_)
         {
            addEventListener(Event.ENTER_FRAME,this._0gZ_);
         }
      }
      
      public static function _1tD_(param1:Number) : Number
      {
         return param1 / _G_A_;
      }
      
      override public function addObj(param1:BasicObject, param2:Number, param3:Number) : void
      {
         param1.x_ = param2;
         param1.y_ = param3;
         if(this._0j8)
         {
            this._0Z___.push(param1);
         }
         else
         {
            this.internalAddObj(param1);
         }
      }
      
      override public function internalAddObj(param1:BasicObject) : void
      {
         var _loc2_:Dictionary = oDict_;
         if(_loc2_[param1.objectId_] != null)
         {
            return;
         }
         param1.map_ = this;
         _loc2_[param1.objectId_] = param1;
      }
      
      override public function internalRemoveObj(param1:int) : void
      {
         var _loc2_:Dictionary = oDict_;
         var _loc3_:BasicObject = _loc2_[param1];
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.removeFromMap();
         delete _loc2_[param1];
      }
      
      override public function update(param1:int, param2:int) : void
      {
         var _loc3_:BasicObject = null;
         var _loc4_:int = 0;
         this._0j8 = true;
         for each(_loc3_ in oDict_)
         {
            if(!_loc3_.update(param1,param2))
            {
               this._kT_.push(_loc3_.objectId_);
            }
         }
         this._0j8 = false;
         for each(_loc3_ in this._0Z___)
         {
            this.internalAddObj(_loc3_);
         }
         this._0Z___.length = 0;
         for each(_loc4_ in this._kT_)
         {
            this.internalRemoveObj(_loc4_);
         }
         this._kT_.length = 0;
      }
      
      override public function draw(param1:View, param2:int) : void
      {
         var _loc3_:BasicObject = null;
         var _loc4_:int = 0;
         this.graphicsData_.length = 0;
         for each(_loc3_ in oDict_)
         {
            _loc4_++;
            _loc3_.scaleBoundary(_G_A_);
            _loc3_.draw(this.graphicsData_,param1,param2);
         }
         graphics.clear();
         if(this.graphicsData_.length > 0)
         {
            graphics.drawGraphicsData(this.graphicsData_);
         }
      }
      
      private function _0gZ_(param1:Event) : void
      {
         var _loc2_:* = 600;
         var _loc3_:* = 600;
         if(this.time != 0)
         {
            this._1T_S_ = getTimer() - this.time;
         }
         this._xJ_ = this._xJ_ + this._1T_S_;
         this.time = getTimer();
         if(this._xJ_ > 500)
         {
            this._xJ_ = 0;
            this._1S_N_(Math.random() * 600,-100);
         }
         this.update(this.time,this._1T_S_);
         this.draw(null,this.time);
      }
      
      private function _0X_l(param1:Number, param2:Number, param3:int = 20, param4:int = 12447231) : void
      {
         var _loc5_:GameObject = new GameObject(null);
         _loc5_.x_ = _1tD_(param1);
         _loc5_.y_ = _1tD_(param2);
         var _loc6_:_G_Q_ = new _G_Q_(_loc5_,param3,param4);
         this.addObj(_loc6_,_loc5_.x_,_loc5_.y_);
      }
      
      private function _1S_N_(param1:Number, param2:Number, param3:int = 20, param4:int = 12447231) : void
      {
         var _loc5_:_H_Q_ = new _H_Q_();
         var _loc6_:_H_Q_ = new _H_Q_();
         _loc5_.x_ = _1tD_(param1);
         _loc5_.y_ = _1tD_(param2);
         _loc6_.x_ = _1tD_(param1);
         _loc6_.y_ = _1tD_(600);
         var _loc7_:ConfettiEffect = new ConfettiEffect(_loc5_,_loc6_,param4,param3,true);
         this.addObj(_loc7_,_loc5_.x_,_loc5_.y_);
      }
      
      private function _0vC_(param1:Number, param2:Number, param3:Number, param4:Number, param5:int = 200, param6:int = 12447231) : void
      {
         var _loc7_:GameObject = new GameObject(null);
         _loc7_.x_ = _1tD_(param1);
         _loc7_.y_ = _1tD_(param2);
         var _loc8_:_H_Q_ = new _H_Q_();
         _loc8_.x_ = _1tD_(param3);
         _loc8_.y_ = _1tD_(param4);
         var _loc9_:_1D_9 = new _1D_9(_loc7_,_loc8_,param6,param5);
         this.addObj(_loc9_,_loc7_.x_,_loc7_.y_);
      }
   }
}
