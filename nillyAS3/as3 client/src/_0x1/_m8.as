package _0x1
{
   import com.company.assembleegameclient.objects._sV_;
   import _0cH_._1O_F_;
   import com.company.assembleegameclient.objects.Portrait;
   
   public class _m8
   {
       
      
      public var id_:String;
      
      public var _1B_5:_sV_;
      
      public var size_:int = 100;
      
      public var z_:Number = 0;
      
      public var duration_:Number = 0;
      
      public var _null_:_1O_F_ = null;
      
      public function _m8(param1:XML)
      {
         super();
         this.id_ = param1.@id;
         this._1B_5 = new Portrait(param1);
         if(param1.hasOwnProperty("Size"))
         {
            this.size_ = Number(param1.Size);
         }
         if(param1.hasOwnProperty("Z"))
         {
            this.z_ = Number(param1.Z);
         }
         if(param1.hasOwnProperty("Duration"))
         {
            this.duration_ = Number(param1.Duration);
         }
         if(param1.hasOwnProperty("Animation"))
         {
            this._null_ = new _1O_F_(param1);
         }
      }
   }
}
