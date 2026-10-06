package es.menuymovimiento.app;

import android.content.Context;
import android.print.PrintManager;
import android.webkit.WebView;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

/** Abre el diálogo de impresión de Android (impresora o "Guardar como PDF") con la pantalla actual. */
@CapacitorPlugin(name = "Imprimir")
public class PrintPlugin extends Plugin {
    @PluginMethod
    public void print(PluginCall call) {
        final String title = call.getString("title", "Menú y Movimiento");
        getActivity().runOnUiThread(() -> {
            PrintManager pm = (PrintManager) getActivity().getSystemService(Context.PRINT_SERVICE);
            WebView wv = getBridge().getWebView();
            pm.print(title, wv.createPrintDocumentAdapter(title), null);
            call.resolve();
        });
    }
}
