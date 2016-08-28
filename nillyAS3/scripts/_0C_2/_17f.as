package _0C_2
{
   import flash.net.SharedObject;
   import com.company.assembleegameclient.util.GUID;
   
   public class _17f
   {
       
      
      private var guid:String;
      
      public function _17f()
      {
         super();
      }
      
      public function _G_Y_() : String
      {
         return this.guid = this.guid || this._0C_y();
      }
      
      private function _0C_y() : String
      {
         var _loc1_:String = null;
         var _loc2_:SharedObject = null;
         try
         {
            _loc2_ = SharedObject.getLocal("nKongregateRotMG","/");
            if(_loc2_.data.hasOwnProperty("GuestGUID"))
            {
               _loc1_ = _loc2_.data["GuestGUID"];
            }
         }
         catch(error:Error)
         {
         }
         if(_loc1_ == null)
         {
            _loc1_ = GUID.create();
            try
            {
               _loc2_ = SharedObject.getLocal("nKongregateRotMG","/");
               _loc2_.data["GuestGUID"] = _loc1_;
               _loc2_.flush();
            }
            catch(error:Error)
            {
            }
         }
         return _loc1_;
      }
   }
}
