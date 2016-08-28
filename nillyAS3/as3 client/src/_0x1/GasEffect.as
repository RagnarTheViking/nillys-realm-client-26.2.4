package _0x1
{
   import com.company.assembleegameclient.objects.GameObject;
   import com.company.assembleegameclient.util._0xp;
   
   public class GasEffect extends ParticleEffect
   {
       
      
      public var go_:GameObject;
      
      public var props:_0x1._0wq;
      
      public var color_:int;
      
      public var rate:Number;
      
      public var type:String;
      
      public function GasEffect(param1:GameObject, param2:_0x1._0wq)
      {
         super();
         this.go_ = param1;
         this.color_ = param2.color;
         this.rate = param2.rate;
         this.props = param2;
      }
      
      override public function update(param1:int, param2:int) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:_0B_s = null;
         var _loc10_:int = 0;
         if(this.go_.map_ == null)
         {
            return false;
         }
         x_ = this.go_.x_;
         y_ = this.go_.y_;
         var _loc9_:int = 20;
         while(_loc10_ < this.rate)
         {
            _loc3_ = (Math.random() + 0.3) * 200;
            _loc4_ = Math.random();
            _loc5_ = _0xp._0__x(this.props.speed - this.props.speed * (_loc4_ * (1 - this.props.speedVariance)));
            _loc6_ = _0xp._0__x(this.props.speed - this.props.speed * (_loc4_ * (1 - this.props.speedVariance)));
            _loc7_ = this.props.life * 1000 - this.props.life * 1000 * (_loc4_ * this.props.lifeVariance);
            _loc8_ = new _0B_s(_loc3_,this.color_,_loc7_,this.props.spread,0.75,_loc5_,_loc6_);
            map_.addObj(_loc8_,x_,y_);
            _loc10_++;
         }
         return true;
      }
   }
}
