**Yo:** Sixto José Romero Martínez  
**Como:** Desarrollador FullStack  
**Necesito:** Implementar el módulo de Estructura Organizacional.
			  La funcionalidad de Estructura Organizacional permitirá crear y administrar jerarquías dinámicas y multinivel dentro de la plataforma, 
			  donde cada elemento podrá tener hijos y estos a su vez nuevos niveles descendientes, formando una estructura tipo árbol recursiva. 
			  Esto permitirá modelar organizaciones complejas como Zonas, Regiones, Distritos, Iglesias o Ministerios, 
			  soportando niveles ilimitados de profundidad y manteniendo la relación Padre → Hijo entre los registros.


Criterios de Aceptación:

* El módulo sólo debe ser accesible para los usuarios que cumplan con el rol que se le configure como el Administrador, Pastor, etc.
* El sistema debe permitir crear estructuras organizacionales principales (nodos raíz) sin necesidad de un padre asociado.
* El sistema debe permitir asociar un nodo hijo a cualquier nodo existente dentro de la estructura organizacional.
* Cada nodo hijo debe mantener la referencia del nodo padre al que pertenece.
* La estructura organizacional debe soportar niveles ilimitados de jerarquía.
* El sistema debe visualizar la estructura en forma jerárquica tipo árbol (TreeView).
* Al seleccionar un nodo del árbol, el sistema debe permitir crear nuevos hijos sobre dicho nodo.
* El sistema debe permitir editar la información de cualquier nodo existente sin afectar su relación jerárquica.
* El sistema debe permitir eliminar nodos siempre que las reglas de negocio lo permitan.
* La visualización debe reflejar correctamente la relación Padre → Hijo en todos los niveles.
* El sistema debe cargar automáticamente los hijos correspondientes al expandir un nodo del árbol.
* La estructura debe conservar el orden jerárquico correctamente después de crear, editar o eliminar nodos.
* El sistema debe validar que no existan ciclos jerárquicos (un nodo no puede ser hijo de sí mismo ni de uno de sus descendientes).
* La solución debe manejar correctamente estructuras profundas sin afectar la estabilidad de la aplicación.
* La implementación debe respetar la arquitectura actual de la solución ROCA.Emuna360 y el patrón MVVM aplicado en el proyecto de presentación.

Arquitectura:

* Debe respetar la arquitectura actual trabajada MVVM y con MudBlazor.
* El componente debe estar en Components/Pages/EstructuraOrganizacional/ConfigEstructuraOrganizacional.razor, con el nombre que indico ConfigEstructuraOrganizacional.razor
* El componente debe tener 2 secciones la Izquierda y Derecha, en la Izquierda debe estar un TreeView, te comparto el html del componente que debe tener, para que tengas una guía como implementarlo, usando mejoras en ellas y bien aplicadas

<MudPaper Class="pa-4" Elevation="2">
    <MudGrid>
        <!-- Columna Izquierda: Lista de Estructuras Organizacionales -->
        <MudItem xs="12" sm="6" md="6">
            <MudCard>
                <MudCardHeader>
                    <CardHeaderContent>
                        <MudText Typo="Typo.h6">Estructuras Organizacionales</MudText>
                        <MudText Typo="Typo.body2" Class="mud-text-secondary">
                            Gestione la estructura organizacional del sistema
                        </MudText>
                    </CardHeaderContent>
                </MudCardHeader>

                <MudCardContent Class="pa-0">
                    @if (_isLoadingList)
                    {
                        @* Estado de carga *@
                        <div class="d-flex flex-column align-center justify-center py-8">
                            <MudProgressCircular Color="Color.Primary" Indeterminate="true" Size="Size.Large" />
                            <MudText Typo="Typo.body2" Class="mud-text-secondary mt-4">
                                Cargando estructuras organizacionales...
                            </MudText>
                        </div>
                    }
                    else if (_estructuras != null && _estructuras.Any())
                    {
                        @* Estado con datos - TreeView Jerárquico *@
                        <div style="max-height: 600px; overflow-y: auto;">
                            @foreach (var treeItem in _treeItems)
                            {
                                @RenderTreeItem(treeItem, 0)
                            }
                        </div>
                    }
                    else
                    {
                        @* Estado vacío *@
                        <MudPaper Class="pa-8 ma-4 d-flex flex-column align-center justify-center"
                                  Elevation="0"
                                  Style="background-color: var(--mud-palette-action-disabled-background); border-radius: 8px;">
                            <MudIcon Icon="@Icons.Material.Filled.AccountTree"
                                     Size="Size.Large"
                                     Color="Color.Default"
                                     Class="mb-3" />
                            <MudText Typo="Typo.h6" Class="mud-text-secondary mb-2">
                                No hay estructuras organizacionales registradas
                            </MudText>
                            <MudText Typo="Typo.body2" Class="mud-text-secondary text-center">
                                Comience agregando una nueva estructura organizacional al sistema
                            </MudText>
                        </MudPaper>
                    }
                </MudCardContent>

                <MudCardActions>
                    <MudButton Variant="Variant.Outlined" StartIcon="@Icons.Material.Filled.Refresh"
                               OnClick="CargarEstructuras">
                        Recargar
                    </MudButton>
                </MudCardActions>
            </MudCard>
        </MudItem>

        <!-- Columna Derecha: Formulario -->
        <MudItem xs="12" sm="6" md="6">
            <MudCard>
                <MudCardHeader>
                    <CardHeaderContent>
                        <MudText Typo="Typo.h6">
                            @(_esNuevo ? "Nueva Estructura Organizacional" : "Editar Estructura Organizacional")
                        </MudText>
                        <MudText Typo="Typo.body2" Class="mud-text-secondary">
                            Complete el formulario con los datos de la estructura organizacional
                        </MudText>
                    </CardHeaderContent>
                </MudCardHeader>

                <MudCardContent>
                    @if (_editContext != null)
                    {
                        <EditForm EditContext="@_editContext">
                            <DataAnnotationsValidator />

                            <MudGrid>
                                <MudItem xs="12">
                                    <MudTextField T="string"
                                                  Label="Denominación ID"
                                                  Value="@_estructuraModel.Denominacion"
                                                  Variant="Variant.Outlined"
                                                  Margin="Margin.Dense"
                                                  ReadOnly="true"
                                                  InputType="InputType.Text"
                                                  HelperText="Se obtiene automáticamente del sistema" />
                                </MudItem>

                                <MudItem xs="12">
                                    <MudTextField T="string"
                                                  Label="Descripción *"
                                                  @bind-Value="_estructuraModel.Descripcion"
                                                  For="() => _estructuraModel.Descripcion"
                                                  Variant="Variant.Outlined"
                                                  Margin="Margin.Dense"
                                                  Multiline="true"
                                                  Required="true"
                                                  Immediate="true"
                                                  Lines="4" />
                                </MudItem>

                                <!-- Campo oculto para Orden (es Required en el DTO) -->
                                <MudItem xs="12" style="display: none;">
                                    <InputNumber @bind-Value="_estructuraModel.Orden" />
                                </MudItem>

                                <MudItem xs="12">
                                    <MudTextField T="string"
                                                  Label="Responsable (Pastor) *"
                                                  @bind-Value="_estructuraModel.Responsable"
                                                  For="() => _estructuraModel.Responsable"
                                                  Variant="Variant.Outlined"
                                                  Margin="Margin.Dense"
                                                  Required="true"
                                                  Immediate="true"
                                                  HelperText="Ingrese el nombre del responsable" />
                                </MudItem>

                                <MudItem xs="12">
                                    <MudTextField T="string"
                                                  Label="Estructura Padre"
                                                  Value="@_descripcionPadreSeleccionada"
                                                  Variant="Variant.Outlined"
                                                  Margin="Margin.Dense"
                                                  ReadOnly="true"
                                                  InputType="InputType.Text"
                                                  HelperText="Seleccione una estructura padre desde el árbol (opcional)"
                                                  Adornment="Adornment.End"
                                                  AdornmentIcon="@Icons.Material.Filled.Clear"
                                                  OnAdornmentClick="LimpiarPadre"
                                                  AdornmentColor="Color.Error"
                                                  Disabled="@(!_esNuevo || string.IsNullOrEmpty(_descripcionPadreSeleccionada))" />
                                </MudItem>

                                <MudItem xs="12">
                                    <MudSelect T="string"
                                               Label="Estado *"
                                               Value="@_estadoSeleccionado"
                                               ValueChanged="OnEstadoChanged"
                                               Variant="Variant.Outlined"
                                               Margin="Margin.Dense"
                                               Required="true">
                                        <MudSelectItem Value="@("Activo")">Activo</MudSelectItem>
                                        <MudSelectItem Value="@("Inactivo")">Inactivo</MudSelectItem>
                                    </MudSelect>
                                </MudItem>
                            </MudGrid>

                            <MudStack Row="true" Spacing="2" Class="mt-4" AlignItems="AlignItems.End">
                                <MudButton Variant="Variant.Filled" Color="Color.Primary"
                                           StartIcon="@Icons.Material.Filled.Save"
                                           Disabled="@(!CanSubmit())"
                                           OnClick="IntentarGuardar">
                                    @(_isSaving ? "Guardando..." : "Guardar")
                                </MudButton>
                                <MudButton Variant="Variant.Outlined" StartIcon="@Icons.Material.Filled.Add"
                                           OnClick="NuevaEstructura" Disabled="@_isSaving">
                                    Nuevo
                                </MudButton>
                            </MudStack>
                        </EditForm>
                    }
                </MudCardContent>
            </MudCard>
        </MudItem>
    </MudGrid>
</MudPaper>

* Debes usar el DTO que está en la capa ROCA.Emuna360.Application carpeta DTOs/Structure/EstructuraOrganizacionalDto.cs
* La API que debes usar está en el controlador de el proyecto ROCA.Emuna360.API Controllers/Structure/EstructuraOrganizacionalController.cs
* Crea el servicio necesario para invocar las APIS, debes seguir la arquitectura ya aplicada y no inventar cosas nuevas pero si aplica las mejores prácticas.