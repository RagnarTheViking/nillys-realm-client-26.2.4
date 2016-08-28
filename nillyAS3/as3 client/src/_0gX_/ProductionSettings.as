package _0gX_
{
   import _2l.ClientSettings;
   import com.company.assembleegameclient.parameters.Parameters;
   
   public class ProductionSettings implements ClientSettings
   {
       
      
      private const _1fi:String = !!WebMain.pserver?WebMain.pserverHost:"realmofthemadgod.appspot.com";
      
      private const _0X_F_:String = "http://" + _1fi + (!!WebMain.pserver?":" + WebMain.httpPort:"");
      
      private const _1D_E_:String = _0X_F_;
      
      private const _oX_:String = "UA-11236645-4";
      
      private const _01b:String = "RotMG #{VERSION}.{MINOR}";
      
      public function ProductionSettings()
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
         return this._01b.replace("{VERSION}",Parameters.Build).replace("{MINOR}",Parameters.SubBuild);
      }
      
      public function UsesRemoteTextures() : Boolean
      {
         return false;
      }
      
      public function _1S_x() : Boolean
      {
         return false;
      }
      
      public function _T_a() : Boolean
      {
         return false;
      }
      
      public function _1xr() : Boolean
      {
         return true;
      }
      
      public function _Q_n() : Boolean
      {
         return false;
      }
      
      public function IsTesting() : Boolean
      {
         return true;
      }
      
      public function _17w() : Boolean
      {
         return false;
      }
   }
}
