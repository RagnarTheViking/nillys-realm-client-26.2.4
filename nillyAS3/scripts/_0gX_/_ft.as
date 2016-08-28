package _0gX_
{
   import _2l.ClientSettings;
   import com.company.assembleegameclient.parameters.Parameters;
   
   public class _ft implements ClientSettings
   {
       
      
      private const _1fi:String = "rotmgbbtesting.appspot.com";
      
      private const _0X_F_:String = "http://" + this._1fi;
      
      private const _1D_E_:String = "https://" + this._1fi;
      
      private const _oX_:String = "UA-11236645-6";
      
      private const _01b:String = "<font color=\'#FF0000\'>TESTING</font> #{VERSION}";
      
      public function _ft()
      {
         super();
      }
      
      public function HttpServerAddress(param1:Boolean = false) : String
      {
         return !!param1?this._0X_F_:this._1D_E_;
      }
      
      public function _Q_r() : String
      {
         return this._oX_;
      }
      
      public function Name() : String
      {
         var _loc1_:String = Parameters.Build + "." + Parameters.SubBuild;
         return this._01b.replace("{VERSION}",_loc1_);
      }
      
      public function UsesRemoteTextures() : Boolean
      {
         return true;
      }
      
      public function _1S_x() : Boolean
      {
         return true;
      }
      
      public function _T_a() : Boolean
      {
         return true;
      }
      
      public function _Q_n() : Boolean
      {
         return false;
      }
      
      public function _1xr() : Boolean
      {
         return true;
      }
      
      public function IsTesting() : Boolean
      {
         return false;
      }
      
      public function _17w() : Boolean
      {
         return false;
      }
   }
}
