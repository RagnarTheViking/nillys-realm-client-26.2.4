package _0x1
{
   import com.company.assembleegameclient.util._1C_q;
   
   public class _a5 extends Particle
   {
       
      
      private const _0zX_:Number = 0.0025;
      
      public var startTime:int;
      
      public var speed:Number;
      
      public var spread:Number;
      
      public var _su:Number;
      
      public var life:Number;
      
      public var lifeVariance:Number;
      
      public var speedVariance:Number;
      
      public var _C_7:Number;
      
      public var _1H_u:Number;
      
      public var _M_T_:Number;
      
      public function _a5(param1:uint, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number)
      {
         super(param1,0,75 + Math.random() * 50);
         this._su = param2;
         this.life = param3 * 1000;
         this.lifeVariance = param4;
         this.speedVariance = param5;
         this.spread = param6;
         this._1H_u = 0;
         this._M_T_ = 0;
      }
      
      public static function create(param1:*, param2:uint, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number) : _a5
      {
         var _loc8_:_a5 = _1C_q.getObject(param1) as _a5;
         if(!_loc8_)
         {
            _loc8_ = new _a5(param2,param3,param4,param5,param6,param7);
         }
         return _loc8_;
      }
      
      public function restart(param1:int, param2:int) : void
      {
         this.startTime = param1;
         var _loc3_:Number = Math.random();
         this.speed = (this._su - this._su * (_loc3_ * (1 - this.speedVariance))) * 10;
         if(this.spread > 0)
         {
            this._1H_u = Math.random() * this.spread - 0.1;
            this._M_T_ = Math.random() * this.spread - 0.1;
         }
         var _loc4_:Number = (param2 - param1) / 1000;
         this._C_7 = this.life - this.life * (_loc3_ * (1 - this.lifeVariance));
         z_ = this.speed * _loc4_;
      }
      
      override public function removeFromMap() : void
      {
         super.removeFromMap();
      }
      
      override public function update(param1:int, param2:int) : Boolean
      {
         var _loc3_:Number = (param1 - this.startTime) / 1000;
         this._C_7 = this._C_7 - param2;
         if(this._C_7 <= 0)
         {
            return false;
         }
         z_ = this.speed * _loc3_;
         if(this.spread > 0)
         {
            moveTo(x_ + this._1H_u * param2 * this._0zX_,y_ + this._M_T_ * param2 * this._0zX_);
         }
         return true;
      }
   }
}
