package com.company.assembleegameclient.objects
{
   import com.company.assembleegameclient.map.Map;
   import com.company.assembleegameclient.map.Square;
   import _0gO_.Object3D;
   import flash.display.IGraphicsData;
   import com.company.assembleegameclient.map.View;
   
   public class BasicObject
   {
      
      private static var _dW_:int = 0;
       
      
      public var map_:Map;
      
      public var square_:Square;
      
      public var objectId_:int;
      
      public var x_:Number;
      
      public var y_:Number;
      
      public var z_:Number;
      
      public var hasShadow:Boolean;
      
      public var isVisible:Boolean;
      
      public var _D_E_:Vector.<Number>;
      
      public var _P_c:Vector.<Number>;
      
      public var sortVal_:Number;
      
      public function BasicObject()
      {
         this._D_E_ = new Vector.<Number>();
         this._P_c = new Vector.<Number>();
         super();
         this.clear();
      }
      
      public static function _03v() : int
      {
         return 2130706432 | _dW_++;
      }
      
      public function clear() : void
      {
         this.map_ = null;
         this.square_ = null;
         this.objectId_ = -1;
         this.x_ = 0;
         this.y_ = 0;
         this.z_ = 0;
         this.hasShadow = false;
         this.isVisible = false;
         this._D_E_.length = 0;
         this._P_c.length = 0;
         this.sortVal_ = 0;
      }
      
      public function dispose() : void
      {
         this.map_ = null;
         this.square_ = null;
         this._D_E_ = null;
         this._P_c = null;
      }
      
      public function update(param1:int, param2:int) : Boolean
      {
         return true;
      }
      
      public function draw3d(param1:Vector.<Object3D>) : void
      {
      }
      
      public function draw(param1:Vector.<IGraphicsData>, param2:View, param3:int) : void
      {
      }
      
      public function drawShadow(param1:Vector.<IGraphicsData>, param2:View, param3:int) : void
      {
      }
      
      public function initObjBoundary(param1:View) : void
      {
         this._D_E_.length = 0;
         this._D_E_.push(this.x_,this.y_,0,this.x_,this.y_,this.z_);
         this._P_c.length = 0;
         param1.wToS_.transformVectors(this._D_E_,this._P_c);
         this.sortVal_ = this._P_c[1];
      }
      
      public function scaleBoundary(param1:Number = 12) : void
      {
         this._D_E_.length = 0;
         this._D_E_.push(this.x_,this.y_,0,this.x_,this.y_,this.z_);
         this._P_c.length = 0;
         this._P_c.push(this.x_ * param1,this.y_ * param1,0,this.x_ * param1,this.y_ * param1,0);
         this.sortVal_ = this._P_c[1];
      }
      
      public function addTo(param1:Map, param2:Number, param3:Number) : Boolean
      {
         this.map_ = param1;
         this.square_ = this.map_.getSquare(param2,param3);
         if(this.square_ == null)
         {
            this.map_ = null;
            return false;
         }
         this.x_ = param2;
         this.y_ = param3;
         return true;
      }
      
      public function removeFromMap() : void
      {
         this.map_ = null;
         this.square_ = null;
      }
   }
}
