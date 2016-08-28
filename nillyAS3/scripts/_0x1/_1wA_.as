package _0x1
{
   import _qR_._0Y_n;
   import com.company.assembleegameclient.objects.GameObject;
   import flash.display.BitmapData;
   import com.company.assembleegameclient.parameters.Parameters;
   import flash.geom.Point;
   
   public class _1wA_ extends _0Y_n
   {
       
      
      private var _0eh:int;
      
      private var dx_:Number;
      
      private var dy_:Number;
      
      private var _lp:Number;
      
      private var _1P_A_:Number;
      
      private var _T_5:Number;
      
      private var _0io:uint = 0;
      
      private var _05e:uint = 0;
      
      private var _1K_R_:uint;
      
      private var go:GameObject;
      
      private var _1gq:Number = 0;
      
      private var _1V_s:Number = 0;
      
      private var cameraAngle:Number;
      
      private var _i1:Vector.<BitmapData>;
      
      public function _1wA_(param1:uint, param2:int, param3:uint, param4:Point, param5:Point, param6:Number, param7:GameObject, param8:Vector.<BitmapData>)
      {
         this.cameraAngle = Parameters.data_.cameraAngle;
         this.go = param7;
         this._T_5 = param6;
         this._i1 = param8;
         super(param8[0],0);
         this._1K_R_ = param8.length;
         this._0eh = param2;
         this.dx_ = (param5.x - param4.x) / this._0eh;
         this.dy_ = (param5.y - param4.y) / this._0eh;
         this._lp = param4.x - param7.x_;
         this._1P_A_ = param4.y - param7.y_;
         _0M_d = -param6 - this.cameraAngle;
      }
      
      override public function update(param1:int, param2:int) : Boolean
      {
         this._0eh--;
         if(this._0eh <= 0)
         {
            return false;
         }
         this._0io++;
         if(this._0io % 2)
         {
            this._05e++;
         }
         _2n = this._i1[this._05e % this._1K_R_];
         this._1gq = this._1gq + this.dx_;
         this._1V_s = this._1V_s + this.dy_;
         if(Parameters.data_.cameraAngle != this.cameraAngle)
         {
            this.cameraAngle = Parameters.data_.cameraAngle;
            _0M_d = -this._T_5 - this.cameraAngle;
         }
         moveTo(this.go.x_ + this._lp + this._1gq,this.go.y_ + this._1P_A_ + this._1V_s);
         return true;
      }
   }
}
