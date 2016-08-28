package _113
{
   import flash.display.Sprite;
   import com.company.assembleegameclient.objects.GameObject;
   import flash.geom.Point;
   import _1gF_.SimpleText;
   import com.company.assembleegameclient.map.View;
   import _1xa._1eo;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.filters.GlowFilter;
   
   public class _13g extends Sprite implements _1V_O_
   {
       
      
      public const _nv:int = 40;
      
      public var go_:GameObject;
      
      public var _1s4:Point;
      
      public var color_:uint;
      
      public var lifetime_:int;
      
      public var dynamic:int;
      
      private var startTime_:int = 0;
      
      private var _1W_r:SimpleText;
      
      public function _13g(param1:GameObject, param2:uint, param3:int, param4:int = 0)
      {
         super();
         this.go_ = param1;
         this._1s4 = new Point(0,-param1.texture_.height * (param1.size_ / 100) * 5 - 20);
         this.color_ = param2;
         this.lifetime_ = param3;
         this.dynamic = param4;
         this._1W_r = new SimpleText().setSize(24).setColor(param2).setBold(true);
         this._1W_r.filters = [new GlowFilter(0,1,4,4,2,1)];
         addChild(this._1W_r);
         visible = false;
      }
      
      public function draw(param1:View, param2:int) : Boolean
      {
         var _loc3_:int = 0;
         if(this.startTime_ == 0)
         {
            this.startTime_ = param2 + this.dynamic;
         }
         if(param2 < this.startTime_)
         {
            visible = false;
            return true;
         }
         _loc3_ = param2 - this.startTime_;
         if(_loc3_ > this.lifetime_ || this.go_ != null && this.go_.map_ == null)
         {
            return false;
         }
         if(this.go_ == null || !this.go_.isVisible)
         {
            visible = false;
            return true;
         }
         visible = true;
         x = (this.go_ != null?this.go_._P_c[0]:0) + (this._1s4 != null?this._1s4.x:0);
         var _loc4_:Number = _loc3_ / this.lifetime_ * this._nv;
         y = (this.go_ != null?this.go_._P_c[1]:0) + (this._1s4 != null?this._1s4.y:0) - _loc4_;
         return true;
      }
      
      public function _0w2() : GameObject
      {
         return this.go_;
      }
      
      public function dispose() : void
      {
         parent.removeChild(this);
      }
      
      public function setStringBuilder(param1:_1eo) : void
      {
         this._1W_r.textChanged.add(this.onTextChanged);
         this._1W_r.setStringBuilder(param1);
      }
      
      private function onTextChanged() : void
      {
         var _loc1_:Bitmap = null;
         var _loc2_:BitmapData = new BitmapData(this._1W_r.width,this._1W_r.height,true,0);
         _loc1_ = new Bitmap(_loc2_);
         _loc2_.draw(this._1W_r,new Matrix());
         _loc1_.x = _loc1_.x - _loc1_.width * 0.5;
         _loc1_.y = _loc1_.y - _loc1_.height * 0.5;
         addChild(_loc1_);
         removeChild(this._1W_r);
         this._1W_r = null;
      }
   }
}
