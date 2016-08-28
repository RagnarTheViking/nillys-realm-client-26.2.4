package _0x1
{
   import com.company.assembleegameclient.objects.GameObject;
   import com.company.assembleegameclient.util._1C_q;
   
   public class BubbleEffect extends ParticleEffect
   {
      
      private static const _8z:Number = 400;
       
      
      private var _1sf:String;
      
      public var go_:GameObject;
      
      public var lastUpdate_:int = -1;
      
      public var _L_u:Number;
      
      private var _null:_0x1._0wq;
      
      public function BubbleEffect(param1:GameObject, param2:_0x1._0wq)
      {
         super();
         this.go_ = param1;
         this._null = param2;
         this._L_u = (1 - param2.rate) * _8z + 1;
         this._1sf = "BubbleEffect_" + Math.random();
      }
      
      override public function update(param1:int, param2:int) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:_a5 = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         if(this.go_.map_ == null)
         {
            return false;
         }
         if(!this.lastUpdate_)
         {
            this.lastUpdate_ = param1;
            return true;
         }
         _loc3_ = int(this.lastUpdate_ / this._L_u);
         var _loc12_:int = int(param1 / this._L_u);
         _loc7_ = this.go_.x_;
         _loc8_ = this.go_.y_;
         if(this.lastUpdate_ < 0)
         {
            this.lastUpdate_ = Math.max(0,param1 - _8z);
         }
         x_ = _loc7_;
         y_ = _loc8_;
         var _loc13_:int = _loc3_;
         while(_loc13_ < _loc12_)
         {
            _loc4_ = _loc13_ * this._L_u;
            _loc9_ = _a5.create(this._1sf,this._null.color,this._null.speed,this._null.life,this._null.lifeVariance,this._null.speedVariance,this._null.spread);
            _loc9_.restart(_loc4_,param1);
            _loc5_ = Math.random() * Math.PI;
            _loc6_ = Math.random() * 0.4;
            _loc10_ = _loc7_ + _loc6_ * Math.cos(_loc5_);
            _loc11_ = _loc8_ + _loc6_ * Math.sin(_loc5_);
            map_.addObj(_loc9_,_loc10_,_loc11_);
            _loc13_++;
         }
         this.lastUpdate_ = param1;
         return true;
      }
      
      override public function removeFromMap() : void
      {
         super.removeFromMap();
         _1C_q.dump(this._1sf);
      }
   }
}
